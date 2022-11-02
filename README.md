<h1 align='center'>Инструкция по работе со скриптами очистки ПК</h1>

<p>
    <strong>Шаг 1.</strong> Разрешить запуск скриптов PowerShell:
</p>

<pre>Set-ExecutionPolicy RemoteSigned </pre>

<i>Подтвердить изменение политики запуска PS1 скриптов, нажав Y или A.</i>

<p>
    <strong>Шаг 2.</strong> Cклонировать данный репозиторий :
</p>
      <pre>git clone https://github.com/NewErr0r/cleaning_scripts.git</pre>
      
<p>
    <strong>Скрипт "cleaning_scripts.ps1" выполняет следующий ряд функций:</strong><br>
    <i>1. Удаляет все основные известные временные файлы, рассположенные в следующих каталогах: 'C:\Temp\*', 'C:\Windows\Temp\*', 'C:\swsetup';</i><br>
    <i>2. Выполняет очистку корзины</i><br>
    <i>3. Выполняет очистку браузера  Google Chrome и Edge;</i><br>
</p>

<p>
    <strong>Скрипт "CCleaner_install_start.ps1" выполняет следующий ряд функций:</strong><br>
    <i>1. Выполняет установку ПО CCleaner</i><br>
    <i>2. Выполняет запуск данного ПО для очистки ПК</i><br>
</p>

<p>
    <strong><i>В скрипт "cleaning_scripts.ps1" имеется возможность явно прописать пути к каким-либо своим каталогам, помимо основных каталогов хранящих временные файлы</i></strong><br>
    Необходимо добавить во вторую строку в переменную "$OtherCleanPathsArr =" свои значения, например:
</p>
<pre>$OtherCleanPathsArr = 'C:\Temp\*', 'C:\Windows\Temp\*', 'C:\swsetup', C:\Users\%username%\Downloads\*, C:\Users\%username%\Documents\*</pre>

<p>
    <strong>Шаг 3.</strong> Запуск скриптов выполняется посредством нажатия ПКМ по файлу, затем выбор пункта "Выполнить с помощью PowerShell"
</p>
 
