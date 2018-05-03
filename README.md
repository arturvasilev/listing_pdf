# listing_pdf
Генерация листинга файлов исходных кодов в виде tex-файла и pdf-документа с разметкой и аннотацией.

## Зависимости
- sudo yum install texlive-collection-langcyrillic.noarch texlive.x86_64 texlive-t2.noarch texlive-babel.noarch texlive-cm.noarch texlive-cyrillic.noarch texlive-pdflex.noarch

## Использование
```bash
  $ ./scriph.sh <dir-name>/
```
Обязательно должен быть указан каталог с файлами исходных кодов. Скрипт не будет работать при указании отдельных файлов.

## Результат
Результатом работы скрипта являются файлы `listing.txt` и `main.pdf`, появляющиеся в одном каталоге с файлом скрипта.
