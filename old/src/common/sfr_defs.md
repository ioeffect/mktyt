# Библиотека для проверки значения бита

Работа с [побитовыми операторами](./bitops.md) зачастую является крайне утомительным занятием, а их последующие чтение бывает весьма затруднительное. К тому же в большинстве случаев мы используем типовые подходы, такие как установка значение в разряд, получение значения бита и т.д., так почему же нам  не вынести это всё в функции/макросы? 

К счастью, уже есть так библиотека в avr-libc  --- она называется [`sfr_defs`](https://github.com/vancegroup-mirrors/avr-libc/blob/master/avr-libc/include/avr/sfr_defs.h). И подключается следующим образом:
```c
#include <avr/sfr_defs.h>
```
---

Рассмотрим её основной функционал.

## Чтение разряда 

- **Проверка выбранного разряда на наличие лог. нуля** 
	```c
	//        значение
	//           v
	bit_is_clear(A, N)
	//              ^
	//         номер разряда
	```
	Пример использования
	```c
		if (bit_is_clear(PINB, btn))
			// потушить светодиод 
	```
- **Проверка выбранного разряда на наличие лог. единице**
	```c
	//      значение
	//         v
	bit_is_set(A, N)
	//            ^
	//      номер разряда
	```
	Пример использования
	```c
		if (bit_is_set(PINB, btn))
			// зажечь светодиод 
	```

## Запись в разряд лог. единицы
```c
_BV(bit)
//   ^
// номер разряда
```
 Пример использования:
```c
_BV(3) // 0b0000 1000

PORTB &= ~_BV(led) 
```

## Ожидание определенного значения бита 

Эти команды останавливают поток выполнения программы до тех пор, пока не будет выполнено условие. 

- Ожидание появления лог. единицы в разряде 
	```c
	//                 значение
	//                    v
	loop_until_bit_is_set(A, N)
	//                       ^ 
	//                  номер разряда
	```
	Пример использования:
	```c
	loop_until_bit_is_set(PINB, btn);
	```
- Ожидание появления лог. нуля в разряде 
	```c
	//                  значение
	//                      v
	loop_until_bit_is_clear(A, N)
	//                         ^ 
	//                  номер разряда
	```
	Пример использования:
	```c
	loop_until_bit_is_clear(PINB, btn);
	```