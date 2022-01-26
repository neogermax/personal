/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION GLOBAL                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
var _letters = ["I", "V", "X", "L", "C", "D", "M", "(V)", "(X)", "(L)", "(C)", "(D)", "(M)"];
var _regexp = /^((\(M\)){0,3})(\(C\)\(M\)|\(C\)\(D\)|(\(D\))?(\(C\)){0,3})(\(X\)\(C\)|\(X\)\(L\)|(\(L\))?(\(X\)){0,3})(M\(X\)|M\(V\)|(\(V\))?)(M{0,3})(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$/;
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
// #REGION CONVERSION                                                                                                    
/*------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------*/
//Convertidor a romanos
function ConvertRoman(number) {
    if (number > 3999999) throw "Numbers higher than 3999999 can't be converted to Roman. Try a lower value!";

    var roman = "";
    var cant = String(number).length;
    var narray = String(number).split("").reverse();

    var parser = function (item, index, a) {

        switch (item) {

            case "0":
            case "1":
            case "2":
            case "3":
                roman = (new Array(Number(item) + 1).join(_letters[index * 2])) + roman;
                break;

            case "4":
                roman = _letters[index * 2] + _letters[index * 2 + 1] + roman;
                break;

            case "5":
            case "6":
            case "7":
            case "8":
                roman = _letters[index * 2 + 1] + (new Array(Number(item) - 4).join(_letters[index * 2])) + roman;
                break;

            case "9":
                roman = _letters[index * 2] + _letters[index * 2 + 2] + roman;
                break;

        }

    }

    narray.forEach(parser);

    return roman;
}

//---Función de devolver un número a partir de un string romano
function ConverNumber(str) {

    var cant = str.length;
    var chars = [];
    var ret = 0;

    switch (cant) {

        case 1:
            ret = getNumberByIndex(_letters.indexOf(str));
            break;

        case 2:
            chars = str.split("");
            ret = ((_letters.indexOf(chars[0]) < _letters.indexOf(chars[1])) ? getNumberByIndex(_letters.indexOf(chars[1])) - getNumberByIndex(_letters.indexOf(chars[0])) : getNumberByIndex(_letters.indexOf(chars[0])) + getNumberByIndex(_letters.indexOf(chars[1])));
            break;

        case 3:
            chars = str.split("");
            ret = sumAllNumbers(getNumberByIndex(_letters.indexOf(chars[0])), getNumberByIndex(_letters.indexOf(chars[1])), getNumberByIndex(_letters.indexOf(chars[2])));
            break;

        case 4:
            chars = str.split("");
            ret = sumAllNumbers(getNumberByIndex(_letters.indexOf(chars[0])), getNumberByIndex(_letters.indexOf(chars[1])), getNumberByIndex(_letters.indexOf(chars[2])), getNumberByIndex(_letters.indexOf(chars[3])));
            break;

        case 5:
            chars = str.split("");
            ret = sumAllNumbers(getNumberByIndex(_letters.indexOf(chars[0])), getNumberByIndex(_letters.indexOf(chars[1])), getNumberByIndex(_letters.indexOf(chars[2])), getNumberByIndex(_letters.indexOf(chars[3])), getNumberByIndex(_letters.indexOf(chars[4])));
            break;

        case 6:
            chars = str.split("");
            ret = sumAllNumbers(getNumberByIndex(_letters.indexOf(chars[0])), getNumberByIndex(_letters.indexOf(chars[1])), getNumberByIndex(_letters.indexOf(chars[2])), getNumberByIndex(_letters.indexOf(chars[3])), getNumberByIndex(_letters.indexOf(chars[4])), getNumberByIndex(_letters.indexOf(chars[5])));
            break;

        case 7:
            chars = str.split("");
            ret = sumAllNumbers(getNumberByIndex(_letters.indexOf(chars[0])), getNumberByIndex(_letters.indexOf(chars[1])), getNumberByIndex(_letters.indexOf(chars[2])), getNumberByIndex(_letters.indexOf(chars[3])), getNumberByIndex(_letters.indexOf(chars[4])), getNumberByIndex(_letters.indexOf(chars[5])), getNumberByIndex(_letters.indexOf(chars[6])));
            break;

        case 8:
            chars = str.split("");
            ret = sumAllNumbers(getNumberByIndex(_letters.indexOf(chars[0])), getNumberByIndex(_letters.indexOf(chars[1])), getNumberByIndex(_letters.indexOf(chars[2])), getNumberByIndex(_letters.indexOf(chars[3])), getNumberByIndex(_letters.indexOf(chars[4])), getNumberByIndex(_letters.indexOf(chars[5])), getNumberByIndex(_letters.indexOf(chars[6])), getNumberByIndex(_letters.indexOf(chars[7])));
            break;

        case 9:
            chars = str.split("");
            ret = sumAllNumbers(getNumberByIndex(_letters.indexOf(chars[0])), getNumberByIndex(_letters.indexOf(chars[1])), getNumberByIndex(_letters.indexOf(chars[2])), getNumberByIndex(_letters.indexOf(chars[3])), getNumberByIndex(_letters.indexOf(chars[4])), getNumberByIndex(_letters.indexOf(chars[5])), getNumberByIndex(_letters.indexOf(chars[6])), getNumberByIndex(_letters.indexOf(chars[7])), getNumberByIndex(_letters.indexOf(chars[8])));
            break;

        case 10:
            chars = str.split("");
            ret = sumAllNumbers(getNumberByIndex(_letters.indexOf(chars[0])), getNumberByIndex(_letters.indexOf(chars[1])), getNumberByIndex(_letters.indexOf(chars[2])), getNumberByIndex(_letters.indexOf(chars[3])), getNumberByIndex(_letters.indexOf(chars[4])), getNumberByIndex(_letters.indexOf(chars[5])), getNumberByIndex(_letters.indexOf(chars[6])), getNumberByIndex(_letters.indexOf(chars[7])), getNumberByIndex(_letters.indexOf(chars[8])), getNumberByIndex(_letters.indexOf(chars[9])));
            break;

    }

    return ret;

}

//---Retornar un número de acuerdo a su index en el arreglo de letras
function getNumberByIndex(index) {
    return ((index % 2 == 0) ? Math.pow(10, index / 2) : Math.pow(10, (index + 1) / 2) / 2);
}

//---Función de sumar varios números
function sumAllNumbers() {
    return Array.prototype.reduce.call(arguments, function (s, n) {
        return s + n;
    }, 0);
}
