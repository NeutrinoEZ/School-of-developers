# Компиляция и запуск программы

1. Установить NASM (если не установлен)
```commandline
sudo apt install nasm
```

2. Компиляция исходного кода

```commandline
nasm -f elf64 dz2_2.asm -o dz2_2.o
```

3. Линковка в исполняемый файл

```commandline
ld dz2_2.o -o dz2_2
```

4. Запуск программы

```commandline
./dz2_2
```