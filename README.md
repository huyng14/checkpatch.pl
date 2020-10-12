# checkpatch.pl
https://people.communitybridge.org/project/682b8b07-8fb4-4243-8932-cc27ecea2d0b

### Download source code
```
git clone https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
git checkout remotes/origin/linux-5.8.y
git rev-list --no-merges HEAD > ./no-merge.txt
```
### Run checkpatch.pl by each non-merge commit
There is a sample [`run-checkpatch2.sh`](task1/run-checkpatch2.sh) file under the `task1` directory that uses to run checkpatch.pl and save the results in [`checkpatch-report-witherror`](task1/checkpatch-report-witherror) file.
