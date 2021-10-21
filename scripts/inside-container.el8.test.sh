
MNT=/vol
dnf install -y dnf-plugins-core
dnf config-manager --disable \*
sed -e "s@http://[^:]\+:8080/@file://$MNT/_download_path/build-6-6-0-centos-8-x86-64-repo-packages/@" \
  -e "s@/pulp/content/repo-packages/6.6.0/CentOS/8/x86-64/slim-@/@g" $MNT/output/*.repo > /etc/yum.repos.d/slim.repo

dnf clean all
dnf makecache

streams=($(grep -E -v '^ *\#' $MNT/build/6.6.0/CentOS/8/x86_64/repo_packages.yaml | grep '^ *- stream:' | awk -F 'stream: *' '{print $2}' | sed -e 's/#.*$//'))
for i in "${streams[@]}"; do printf "\n\n=== $i\n"; dnf module enable -y $i; done

repos=($(dnf repolist | grep -v '^repo id ' | awk '{print $1}'))
dnf repoclosure $(for i in "${repos[@]}"; do  echo -n "--repoid $i "; done)


echo "paste this into clean container: "
echo 'dnf install -y dnf-plugins-core'
echo 'dnf config-manager --disable \*'
echo 'dnf clean all; dnf makecache'
echo dnf config-manager --add-repo https://dl.fedoraproject.org/pub/epel/8/Modular/x86_64/  --add-repo http://yum.puppet.com/puppet6/el/8/x86_64/ --add-repo http://mirror.centos.org/centos/8/BaseOS/x86_64/os/ --add-repo http://mirror.centos.org/centos/8/AppStream/x86_64/os/ --add-repo http://mirror.centos.org/centos/8/extras/x86_64/os/ --add-repo http://mirror.centos.org/centos/8/PowerTools/x86_64/os/ --add-repo https://download.fedoraproject.org/pub/epel/8/Everything/x86_64/ --add-repo https://download.postgresql.org/pub/repos/yum/9.6/redhat/rhel-8-x86_64/
echo "${streams[@]}" |xargs echo  dnf module enable -y $i
echo echo dnf repoclosure $(for i in "${repos[@]}"; do  echo -n "--repoid $i "; done)


# dnf module enable -y ruby:2.7 389-directory-server:stable 389-ds:1.4 httpd:2.4 freeradius:3.0 mariadb:10.3 mysql:8.0 perl:5.26 perl-IO-Socket-SSL:2.066 perl-libwww-perl:6.34 python36:3.6 ruby:2.7

# dnf repoclosure --repoid pulp-AppStream --repoid pulp-BaseOS --repoid pulp-PowerTools --repoid pulp-epel --repoid pulp-epel-modular --repoid pulp-extras --repoid pulp-postgresql --repoid pulp-puppet
