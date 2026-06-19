#!/usr/bin/env python3
"""
cls_stress_test.py
Generates file churn with ECCN-tagged content and controlled filename patterns
to trigger DG ACI classification and .cls sidecar writes.
"""

import os
import shutil
import time
import random
import string
import argparse
import re

# --- Configuration ---

ECCN_CODES = [
    "3D001", "3D002", "3D003", "3D991", "3D992",
    "3E001", "3E991", "EAR99", "3E005"
]

FILENAME_PATTERNS = [
    re.compile(r'.*VOLU.*'),
    re.compile(r'.*REQS.*'),
    re.compile(r'.*TOOL.*'),
    re.compile(r'.*SERV.*'),
    re.compile(r'.*ANCI.*'),
]

FILENAME_STEMS = ["VOLU", "REQS", "TOOL", "SERV", "ANCI"]

def rand_suffix(k=6):
    return ''.join(random.choices(string.ascii_uppercase + string.digits, k=k))

def make_filename(i):
    stem = random.choice(FILENAME_STEMS)
    return f"{stem}_{i}_{rand_suffix()}.txt"

def make_content():
    """Generate a text block embedding random ECCN codes."""
    eccn = random.sample(ECCN_CODES, k=random.randint(1, 4))
    lines = [
        f"Document reference: DOC-{rand_suffix()}",
        f"Classification: {', '.join(eccn)}",
        f"Description: Technology export control test file.",
        f"Item ECCN: {random.choice(ECCN_CODES)}",
        f"Notes: {''.join(random.choices(string.ascii_letters + ' ', k=120))}",
    ]
    return '\n'.join(lines)

def validate_filename(name):
    """Assert generated name matches at least one pattern."""
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
                f.write(make_content())
            live_files.append(path)
            print(f"[CREATE] {path}")

        elif action == 'modify' and live_files:
            path = random.choice(live_files)
            if os.path.exists(path):
                with open(path, 'a') as f:
                    f.write('\n' + make_content())
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
