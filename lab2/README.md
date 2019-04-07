# Лабораторная работа №2
## Задание 1 (Установка ОС и настройка LVM, RAID)
1. Создание новой виртуальной машины, выдав ей следующие характеристики:
* 1 gb ram
* 1 cpu
* 2 hdd (назвав их ssd1, ssd2 и назначил равный размер, поставив галочки hot swap и ssd)
* SATA контроллер настроен на 4 порта
![alt-текст](https://github.com/Kindface/Linux-labs/blob/master/lab2/images/Screenshot_1.png)
2. Начало установки Linux:
![alt-текст](https://github.com/Kindface/Linux-labs/blob/master/lab2/images/VirtualBox_Raid_26_03_2019_16_55_33.png)
* Настройка отдельного раздела под /boot: Выбрав первый диск, создал на нем новую таблицу разделов
    + Partition size: 512M
    + Mount point: /boot
    + Повторил настройки для второго диска, выбрав mount point:none
![alt-текст](https://github.com/Kindface/Linux-labs/blob/master/lab2/images/VirtualBox_Raid_26_03_2019_17_02_56.png)
* Настройка RAID
    + Выбрал свободное место на первом диске и настроил в качестве типа раздела physical volume for RAID
    + Выбрал "Done setting up the partition"
    + Повторил настройку для второго диска
![alt-текст](https://github.com/Kindface/Linux-labs/blob/master/lab2/images/VirtualBox_Raid_26_03_2019_17_05_12.png)
* Выбрал пункт "Configure software RAID"
    + Create MD device
    + Software RAID device type: Выберите зеркальный массив
    + Active devices for the RAID XXXX array: Выбрать оба диска
    + Spare devices: Оставить 0 по умолчанию
    + Active devices for the RAID XX array: выбрать разделы, которые вы создавали под raid
    + Finish
* В итоге получил: 
![alt-текст](https://github.com/Kindface/Linux-labs/blob/master/lab2/images/VirtualBox_Raid_26_03_2019_17_12_17.png)
* Настройка LVM: Выбрал Configure the Logical Volume Manager
    + Keep current partition layout and configure LVM: Yes
    + Create volume group
    + Volume group name: system
    + Devices for the new volume group: Выбрал созданный RAID
    + Create logical volume
    + logical volume name: root
    + logical volume size: 2\5 от размера диска
    + Create logical volume
    + logical volume name: var
    + logical volume size: 2\5 от размера диска
    + Create logical volume
    + logical volume name: log
    + logical volume size: 1\5 от размера диска
     + Выбрав Display configuration details получил следующую картину: 
![alt-текст](https://github.com/Kindface/Linux-labs/blob/master/lab2/images/VirtualBox_Raid_26_03_2019_17_17_21.png)
    + Завершив настройку LVM увидел следующее:
![alt-текст](https://github.com/Kindface/Linux-labs/blob/master/lab2/images/VirtualBox_Raid_26_03_2019_17_18_04.png)
* Разметка разделов: по-очереди выбрал каждый созданный в LVM том и разметил их, например, для root так:
    + Use as: ext4
    + mount point: /
    + повторил операцию разметки для var и log выбрав соответствующие точки монтирования (/var и /var/log), получив следующий результат:
![alt-текст](https://github.com/Kindface/Linux-labs/blob/master/lab2/images/VirtualBox_Raid_26_03_2019_17_20_07.png)
* Финальный результат получился вот таким:
![alt-текст](https://github.com/Kindface/Linux-labs/blob/master/lab2/images/VirtualBox_Raid_26_03_2019_17_21_02.png)
3. Закончил установку ОС, поставив grub на первое устройство (sda) и загрузил систему.
4. Выполнил копирование содержимого раздела /boot с диска sda (ssd1) на диск sdb (ssd2)
![alt-текст](https://github.com/Kindface/Linux-labs/blob/master/lab2/images/VirtualBox_Raid_26_03_2019_17_28_35.png)
5. Выполнил установку grub на второе устройство:
![alt-текст](https://github.com/Kindface/Linux-labs/blob/master/lab2/images/VirtualBox_Raid_26_03_2019_17_32_43.png)
* Результат команды fdisk -l:
![alt-текст](https://github.com/Kindface/Linux-labs/blob/master/lab2/images/VirtualBox_Raid_26_03_2019_17_33_40.png)
* Результат команды lsblk -o NAME,SIZE,FSTYPE,TYPE,MOUNTPOINT:
    + sda - ssd1
    + sdb -ssd2
![alt-текст](https://github.com/Kindface/Linux-labs/blob/master/lab2/images/VirtualBox_Raid%20v2.0_07_04_2019_18_21_30.png)
* Посмотрел информацию о текущем raid командой cat /proc/mdstat:
![alt-текст](https://github.com/Kindface/Linux-labs/blob/master/lab2/images/VirtualBox_Raid_26_03_2019_17_35_39.png)
Увидел, что активны два raid1 sda2[0] и sdb2[1]
* Выводы команд: pvs, vgs, lvs, mount:
![alt-текст](https://github.com/Kindface/Linux-labs/blob/master/lab2/images/VirtualBox_Raid_26_03_2019_17_36_17.png)
![alt-текст](https://github.com/Kindface/Linux-labs/blob/master/lab2/images/VirtualBox_Raid_26_03_2019_17_36_37.png)
* С помощью этих команд увидел информацию об physical volumes, volume groups, logical volumes, примонтированных устройств.
## Вывод
В этом задании научился устанавливать ОС Linux, настраивать LVM и RAID, а также ознакомился с командами:
 * lsblk -o NAME,SIZE,FSTYPE,TYPE,MOUNTPOINT
 * fdisk -l
 * pvs,lvs,vgs
 * cat /proc/mdstat
 * mount
 * dd if=/dev/xxx of=/dev/yyy
 * grub-install /dev/XXX 
* В результате получил виртуальную машину с дисками ssd1, ssd2.
# Задание 2 (Эмуляция отказа одного из дисков)
1. Удаление диска ssd1 в свойствах машины, проверка работоспособности виртуальной машины.
![alt-текст](https://github.com/Kindface/Linux-labs/blob/master/lab2/images2/VirtualBox_����%20Raid%20v2.0_06_04_2019_09_25_35.png) 
2. Проверка статуса RAID-массива cat /proc/mdstat
![alt-текст](https://github.com/Kindface/Linux-labs/blob/master/lab2/images2/VirtualBox_����%20Raid%20v2.0_06_04_2019_09_26_27.png)
3. Добавление в интерфейсе VM нового диска такого же размера с названием ssd3
![alt-текст](https://github.com/Kindface/Linux-labs/blob/master/lab2/images2/Screenshot_4.png)
4. Выполнение операций:
* Просмотр нового диска, что он приехал в систему командой fdisk -l
* Копирование таблиц разделов со старого диска на новый: sfdisk -d /dev/XXXX | sfdisk /dev/YYY
* Результат
![alt-текст](https://github.com/Kindface/Linux-labs/blob/master/lab2/images2/VirtualBox_lab%202.2_07_04_2019_21_46_35.png)
* Добавление в рейд массив нового диска: mdadm --manage /dev/md0 --add /dev/YYY
![alt-текст](https://github.com/Kindface/Linux-labs/blob/master/lab2/images2/VirtualBox_lab%202.2_07_04_2019_21_47_34.png)
* Результат cat /proc/mdstat
![alt-текст](https://github.com/Kindface/Linux-labs/blob/master/lab2/images2/VirtualBox_lab%202.2_07_04_2019_21_48_13.png)
5. Выполение синхронизации разделов, не входящих в RAID
![alt-текст](https://github.com/Kindface/Linux-labs/blob/master/lab2/images2/VirtualBox_lab%202.2_07_04_2019_21_49_01.png)
6. Установка grub на новый диск
![alt-текст](https://github.com/Kindface/Linux-labs/blob/master/lab2/images2/VirtualBox_lab%202.2_07_04_2019_21_49_25.png)
7. Перезагрузка ВМ и проверка, что все работает
![alt-текст](https://github.com/Kindface/Linux-labs/blob/master/lab2/images2/VirtualBox_������%20�����%20����������_06_04_2019_11_18_44.png)
## Вывод
В этом задании научился:
* Удалять диск ssd1
* Проверять статус RAID-массива
* Копировать таблицу разделов со старого диска на новый
* Добавлять в рейд массив новый диск
* Выполнять синхронизацию разделов, не входящих в RAID

Изучил новые команды:
* sfdisk -d /dev/XXXX | sfdisk /dev/YYY
* mdadm --manage /dev/md0 --add /dev/YYY
Результат: Удален диск ssd1, добавлен диск ssd3, ssd2 сохранили
# Задание 3 (Добавление новых дисков и перенос раздела)







