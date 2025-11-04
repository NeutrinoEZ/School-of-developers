# Компиляция и запуск программы

1. Установить NASM (если не установлен)
```commandline
sudo apt install nasm
```

2. Компиляция исходного кода

```commandline
nasm -f elf64 dz1_2.asm -o dz1_2.o
```

3. Линковка в исполняемый файл

```commandline
ld dz1_2.o -o dz1_2
```

4. Запуск программы

```commandline
./dz1_2
```

5. Проверка результата

```commandline
sudo cat dz1_2.txt
```