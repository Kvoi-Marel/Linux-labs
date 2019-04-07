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


