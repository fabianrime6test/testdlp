#!/usr/bin/env python3
"""
cls_stress_test.py
Generates high-volume file create/modify/rename/delete operations
to trigger DG ACI classification and .cls sidecar writes.
"""

import os
import shutil
import time
import random
import string
import argparse

def rand_content(size=512):
    return ''.join(random.choices(string.ascii_letters + string.digits + ' \n', k=size))

def run(base_dir, iterations, delay):
    os.makedirs(base_dir, exist_ok=True)
    live_files = []

    for i in range(iterations):
        action = random.choice(['create', 'modify', 'rename', 'delete', 'copy'])

        if action == 'create' or not live_files:
            path = os.path.join(base_dir, f"testfile_{i}_{random.randint(1000,9999)}.txt")
            with open(path, 'w') as f:
                f.write(rand_content())
            live_files.append(path)
            print(f"[CREATE] {path}")

        elif action == 'modify' and live_files:
            path = random.choice(live_files)
            if os.path.exists(path):
                with open(path, 'a') as f:
                    f.write(rand_content(128))
                print(f"[MODIFY] {path}")

        elif action == 'rename' and live_files:
            path = random.choice(live_files)
            if os.path.exists(path):
                new_path = path.replace('.txt', f'_renamed_{i}.txt')
                os.rename(path, new_path)
                live_files.remove(path)
                live_files.append(new_path)
                print(f"[RENAME] {path} -> {new_path}")

        elif action == 'copy' and live_files:
            path = random.choice(live_files)
            if os.path.exists(path):
                dst = path.replace('.txt', f'_copy_{i}.txt')
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

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--dir', default='/tmp/cls_test', help='Target directory (use NFS mount for root-squash testing)')
    parser.add_argument('--iterations', type=int, default=200)
    parser.add_argument('--delay', type=float, default=0.05, help='Seconds between ops')
    args = parser.parse_args()
    run(args.dir, args.iterations, args.delay)
