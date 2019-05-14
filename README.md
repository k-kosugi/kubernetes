# Kubernetesクラスタを自動構築するVagrantfile + Ansible Playbook
  
## 1. Vagrantfile
BOXはcentos7を利用。
5マシン起動するよう記述してある。ネットワークはNATと内部ネットワークの2種類。内部ネットワークはKubernetesの通信で利用。
NATはホストとの通信で利用する。

ansibleマシンはansibleをインストールするよう構成している。

1. ansible
1. master
1. node1
1. node2
1. node3

VirtualBoxを利用。

## 2. Playbook
ansibleマシンからmaster/node1/node2/node3の構成を自動化するためのファイル。
Vagrantを利用すると、/vagrantとホストのvagrant up時のディレクトリが共有されるため、ここを利用してansible-playbookコマンドを投入する。

# 使い方
1. vagrantの起動
    ```
    $ vagrant up
    ```
1. すべてのマシンが起動したらansibleマシンに以下のコマンドでログイン
    ```
    $ vagrant ssh ansible
    ```
1. ansibleコマンドを投入してmaster/node1/node2/node3を自動構成
    ```
    $ ansible-playbook -i inventory.txt ./kuber.yaml
    ```
