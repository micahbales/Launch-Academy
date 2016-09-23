exports = (typeof window === 'undefined') ? global : window;

/**
 * This file defines an object with some methods. Some of these methods are
 * populated incorrectly; your job is to fix them. Other methods are not
 * populated at all; your job is to fill them out.
 */

exports.eveningExerciseAnswers = {
  indexOf : function(arr, item) {
    return arr.indexOf(item)
  },

  sum : function(arr) {
    return arr.reduce(function(a,b) {
      return a + b;
    });
  },

  remove : function(arr, item) {
    var newArr = [];
    arr.forEach(function (a) {
      if (a !== item) {
        newArr.push(a);
      }
    });
    return newArr;
  },

  reverseString : function(str) {
    return str.split('').reverse().join('')
  },

  longestSubString : function(str) {
    arr = str.split(' ');
    return arr.reduce(function(a,b) { return a.length > b.length ? a : b; });
  },

  letterMoveForward : function(str) {

 var newString = "";

   for(var i = 0; i < str.length; i++) {
     var letterCode = str.charCodeAt(i);
     var nextLetter = str[i];

     if (letterCode >= 97 && letterCode < 122) {

       var nextLetterCode = letterCode + 1;
       nextLetter = String.fromCharCode(nextLetterCode);

     } else if (letterCode >= 122) {

       letterCode = 97;
       nextLetter = "a";
     }
     newString += nextLetter;
   }
   return newString;
  },

  capitalizeWords : function(str) {
    var arr = [];
    str.split(' ').forEach(function(a) {
      arr.push(a.charAt(0).toUpperCase() + a.slice(1));
    });
    return arr.join(' ');
  }
};
