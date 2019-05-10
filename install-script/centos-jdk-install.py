#!/usr/bin/python
import commands
import os


def have_command(command):
    print 'checking ' + command
    which_command = commands.getoutput('which ' + command)
    result = which_command in '/usr/bin/which'
    return not result


print 'checking install env'


if not have_command('wget'):
    print 'install abort . because not wget'
    print 'please shell exec yum install wget (centos).'
    exit()
else:
    print 'wget->yes'

print 'install env ok!'

_project = 'jdk1.8'
_resource_web = 'https://gitee.com/mathcoder23/mt23_lib/raw/master/'
_project_url1 = _resource_web+'lib/jdk-8u211-linux-x64.tar.gzaa'
_project_url2 = _resource_web+'lib/jdk-8u211-linux-x64.tar.gzab'

if not os.path.exists(_project):
    os.mkdir(_project)
    print 'create dir : ' + _project
os.chdir(_project)
print 'working dir:'+os.getcwd()
print 'downloading '+_project
os.system('wget '+_project_url1)
os.system('wget '+_project_url2)
os.system('cat jdk-8u211-linux-x64.tar.gz* > jdk-8u211-linux-x64.tar.gz')
os.system('rm -rf jdk-8u211-linux-x64.tar.gza*')
os.system('tar -zxvf jdk-8u211-linux-x64.tar.gz .')
os.system('rm -rf jdk-8u211-linux-x64.tar.gz')
os.system("echo 'export JAVA_HOME=% >> /etc/profile'")
os.system("echo 'export PATH=${JAVA_HOME}:$PATH >> /etc/profile'")
os.system("source /etc/profile")
os.system("java -version")

print 'jdk install successful'
