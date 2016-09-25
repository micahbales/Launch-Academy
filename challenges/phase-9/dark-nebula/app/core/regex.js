exports = (typeof window === 'undefined') ? global : window;

exports.regexAnswers = {
  containsNumber : function(str) {
    if (str.search(/\d/g) !== -1) {
      return true
    } else {
      return false
    }
  },

  containsRepeatingLetter : function(str) {
    if (str.search(/([a-z])\1+/ig) !== -1) {
      return true;
    } else {
      return false;
    }
  },

  endsWithVowel : function(str) {
    if (str.search(/([aeiou])\b/ig) !== -1) {
      return true
    } else {
      return false
    }
  },

  captureThreeNumbers : function(str) {
    var myString = str.match(/\d{3}/);
    if (myString) {
      return myString[0];
    } else {
      return false;
    }

  },

  matchesPattern : function(str) {
    if (str.search(/^\d{3}-\d{3}-\d{4}$/g) !== -1) {
      return true;
    } else {
      return false;
    }
  },

  isUSD : function(str) {
    if (str.search(/^\$((\d{1,3},)?(\d{1,3},)?(?=\d{3}))?\d{1,3}(\.\d{2})?$/g) !== -1) {
      return true;
    } else {
      return false;
    }
  }
};
