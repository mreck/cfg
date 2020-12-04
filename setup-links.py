#!/bin/env python3

import os
import sys
import errno


def num(s):
	try:
		return int(s)
	except:
		return -1


repo_root = os.path.dirname(sys.argv[0])
os.chdir(repo_root)

files = os.listdir('home')
files.insert(0, '=ALL=')

for i in range(len(files)):
	print(i, files[i])

links = input('\nWhich do you want to link: ')
links = [num(x) for x in links.split(' ') if len(x) > 0]
links = sorted(set([x for x in links if x > -1]))

if len(links) > 0 and links[0] == 0:
	links = [n for n in range(1, len(files))]

for i in links:
	src = os.path.abspath(os.path.join(repo_root, 'home', files[i]))
	dst = os.path.join(os.path.expanduser('~'), files[i])

	try:
		os.symlink(src, dst)
	except OSError as e:
		if e.errno == errno.EEXIST:
			os.remove(dst)
			os.symlink(src, dst)
		else:
			raise e

	print(dst, '=>', src)
