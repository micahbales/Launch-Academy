exports = (typeof window === 'undefined') ? global : window;

exports.stringsAnswers = {
  reduceString: function(str, amount) {
    var strArr = str.split('');
    var newArr = [strArr[0]];

    var count = 1;
    for (var i = 1; i < strArr.length; i++) {

      if (strArr[i] === strArr[i - 1] && count < amount) {
        newArr.push(strArr[i]);
        count++;
      } else if (strArr[i] !== strArr[i - 1]) {
        newArr.push(strArr[i]);
        count = 1;
      }
    }

    var newString = newArr.join('');
    return newString;
  },

  reverseString: function(str) {
    var string = str.split('').reverse().join('');
    return string;
  }
};
