#Использовать asserts
#Использовать tempfiles

#Использовать ".."

Перем мМенеджерВременныхФайлов;

Функция ПолучитьСписокТестов(Знач ЮнитТестирование) Экспорт

	МассивТестов = Новый Массив;
	МассивТестов.Добавить("Тест_КаталогПустой");
	МассивТестов.Добавить("Тест_ИсключениеКогдаКаталогНеСуществует");
	МассивТестов.Добавить("Тест_КаталогСФайломНепустой");
	МассивТестов.Добавить("Тест_КаталогСПустымВложеннымНепустой");
	
	Возврат МассивТестов;

КонецФункции

Процедура ПередЗапускомТеста() Экспорт
	мМенеджерВременныхФайлов = Новый МенеджерВременныхФайлов;
КонецПроцедуры

Процедура ПослеЗапускаТеста() Экспорт
	мМенеджерВременныхФайлов.Удалить();
КонецПроцедуры

Процедура Тест_КаталогПустой() Экспорт
	
	ТестовыйКаталог = мМенеджерВременныхФайлов.СоздатьКаталог();
	Ожидаем.Что(ФС.КаталогПустой(ТестовыйКаталог)).ЭтоИстина();

КонецПроцедуры

Процедура Тест_ИсключениеКогдаКаталогНеСуществует() Экспорт
	
	ИмяКаталога = "ИмяНесуществующегоКаталога";

	МассивПараметров = Новый Массив;
	МассивПараметров.Добавить(ИмяКаталога);

	Ожидаем.Что(ФС).Метод("КаталогПустой", МассивПараметров).ВыбрасываетИсключение("Каталог <" + ИмяКаталога + "> не существует");

КонецПроцедуры

Процедура Тест_КаталогСФайломНепустой() Экспорт
	
	ТестовыйКаталог = мМенеджерВременныхФайлов.СоздатьКаталог();
	
	мМенеджерВременныхФайлов.БазовыйКаталог = ТестовыйКаталог;
	мМенеджерВременныхФайлов.СоздатьФайл();

	Ожидаем.Что(ФС.КаталогПустой(ТестовыйКаталог)).ЭтоЛожь();

КонецПроцедуры

Процедура Тест_КаталогСПустымВложеннымНепустой() Экспорт
	
	ТестовыйКаталог = мМенеджерВременныхФайлов.СоздатьКаталог();
	
	мМенеджерВременныхФайлов.БазовыйКаталог = ТестовыйКаталог;
	мМенеджерВременныхФайлов.СоздатьКаталог();

	Ожидаем.Что(ФС.КаталогПустой(ТестовыйКаталог)).ЭтоЛожь();

КонецПроцедуры
