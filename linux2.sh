for ((a=0;a<10;a++)); do
for ((b=1;b<=10;b++)); do
text=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n 1);
echo $text > /home/user$a/delta/folder$b/text.txt
done;
done;
