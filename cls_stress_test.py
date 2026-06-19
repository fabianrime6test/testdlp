#!/usr/bin/env python3
"""
cls_stress_test.py
Generates file churn with fixed ECCN content and controlled filename patterns
to trigger DG ACI classification and .cls sidecar writes.
"""

import os
import shutil
import time
import random
import string
import argparse
import re

FILENAME_STEMS = ["VOLU", "REQS", "TOOL", "SERV", "ANCI"]

FILENAME_PATTERNS = [
    re.compile(r'.*VOLU.*'),
    re.compile(r'.*REQS.*'),
    re.compile(r'.*TOOL.*'),
    re.compile(r'.*SERV.*'),
    re.compile(r'.*ANCI.*'),
]

FILE_CONTENT = """test file: 3D001, 3D002, 3D003, 3D991, 3D992, 3E001, 3E991, EAR99, 3E005
test file: 3D001, 3D002, 3D003, 3D991, 3D992, 3E001, 3E991, EAR99, 3E005"""

def rand_suffix(k=6):
    return ''.join(random.choices(string.ascii_uppercase + string.digits, k=k))

def make_filename(i):
    stem = random.choice(FILENAME_STEMS)
    return f"{stem}_{i}_{rand_suffix()}.txt"

def validate_filename(name):
    return any(p.match(name) for p in FILENAME_PATTERNS)

def run(base_dir, iterations, delay):
    os.makedirs(base_dir, exist_ok=True)
    live_files = []

    for i in range(iterations):
        action = random.choice(['create', 'modify', 'rename', 'delete', 'copy'])

        if action == 'create' or not live_files:
            name = make_filename(i)
            assert validate_filename(name), f"Filename {name} matches no pattern — bug in make_filename()"
            path = os.path.join(base_dir, name)
            with open(path, 'w') as f:
                f.write(FILE_CONTENT)
            live_files.append(path)
            print(f"[CREATE] {path}")

        elif action == 'modify' and live_files:
            path = random.choice(live_files)
            if os.path.exists(path):
                with open(path, 'w') as f:
                    f.write(FILE_CONTENT)
                print(f"[MODIFY] {path}")

        elif action == 'rename' and live_files:
            path = random.choice(live_files)
            if os.path.exists(path):
                new_name = make_filename(i)
                new_path = os.path.join(base_dir, new_name)
                os.rename(path, new_path)
                live_files.remove(path)
                live_files.append(new_path)
                print(f"[RENAME] {path} -> {new_path}")

        elif action == 'copy' and live_files:
            path = random.choice(live_files)
            if os.path.exists(path):
                new_name = make_filename(i)
                dst = os.path.join(base_dir, new_name)
                shutil.copy2(path, dst)
                live_files.append(dst)
                print(f"[COPY]   {path} -> {dst}")

        elif action == 'delete' and len(live_files) > 5:
            path = random.choice(live_files)
            if os.path.exists(path):
                os.remove(path)
                live_files.remove(path)
                print(f"[DELETE] {path}")

        time.sleep(delay)

    print(f"\nDone. {len(live_files)} files remaining in {base_dir}")
    print("Sample filenames generated:")
    for p in random.sample(live_files, min(5, len(live_files))):
        print(f"  {os.path.basename(p)}")

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--dir', default='/tmp/cls_test',
                        help='Target directory — use NFS mount for root-squash testing')
    parser.add_argument('--iterations', type=int, default=200)
    parser.add_argument('--delay', type=float, default=0.05,
                        help='Seconds between ops')
    args = parser.parse_args()
    run(args.dir, args.iterations, args.delay)
