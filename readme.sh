i=0
while IFS= read -r line; do
    if [ -e "$line/README.md" ]; then
    	continue
    else
        c=$(echo "$line" | rev | cut -d'/' -f 1 | rev)
        echo "# $c" > "$line/README.md"
        ((i++))
    fi
done < <(find . -type d | grep -v git)

echo "$i README.md file added"
