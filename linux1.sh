#creating users and folder
for ((a=0;a<10;a++)); do
sudo useradd -m user$a;#if home directory is not created
sudo mkdir /home/user$a/delta;
done;

#creating groups
for ((a=0;a<4;a++)); do
sudo groupadd group$a;
done;

#assigning groups to users
for ((b=0;b<10;b++)); do
sudo usermod -a -G group0 user$b;
done;
for ((a=1;a<4;a++)); do
for ((b=$((3*a-2));b<10;b++)); do
sudo usermod -a -G group$a user$b;
done;
done;

#assigning primary groups to users
sudo usermod -g group0 user0;
for ((a=1;a<4;a++)); do
for ((b=$((3*a-2));b<$((3*(a+1)-2));b++)); do
sudo usermod -g group$a user$b;
done;
done;

#creating folders and text.txt and random alphanumeric value
for ((a=0;a<10;a++)); do
mkdir -p /home/user$a/delta/folder{1..10};
for ((b=1;b<=10;b++)); do
text=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n 1);
touch /home/user$a/delta/folder$b/text.txt
echo $text > /home/user$a/delta/folder$b/text.txt
done;
done;

#permission
for ((a=0;a<10;a++)); do
sudo chmod 707 /home/user$a;
done;

#automaticallly update at 3:21 pm
sudo crontab -e 21 15 * * 1,2,3,4,5,6 linux2.sh
