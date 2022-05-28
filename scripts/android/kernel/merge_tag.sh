# Usage
# ./merge_tag.sh <dir> <source> <tag>

# Merge
cd $1 
git fetch $2 $3
git merge FETCH_HEAD

# Resolve conflicts
for i in $(git ls-files -u  | cut -f 2 | sort -u);
do
    $EDITOR --wait $i
    git add $i
done
git merge --continue
