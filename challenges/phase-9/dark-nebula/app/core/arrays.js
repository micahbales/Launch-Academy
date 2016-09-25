exports = (typeof window === 'undefined') ? global : window;

exports.arraysAnswers = {

  removeWithoutCopy : function(arr, item) {
    for (var i = 0; i < arr.length; i++) {
      if (arr[i] === item) {
        arr.splice(i, i + 1);
      }
    }
    return arr;
  },

  append : function(arr, item) {
    arr.push(item);
    return arr;
  },

  truncate : function(arr) {
    arr.pop(arr[-1]);
    return arr;
  },

  prepend : function(arr, item) {
    arr.unshift(item);
    return arr;
  },

  curtail : function(arr) {
    arr.shift();
    return arr;
  },

  concat : function(arr1, arr2) {
    arr3 = arr1.concat(arr2);
    return arr3;
  },

  insert : function(arr, item, index) {
    arr.splice(index, 0, item);
    return arr;
  },

  count : function(arr, item) {
    itemsCount = 0;
    for (var i = 0; i < arr.length; i++) {
      if (arr[i] === item) itemsCount++;
    }
    return itemsCount;
  },

  duplicates : function(arr) {
    arr.sort();
    newArr = [];
    for (var i = 1; i < arr.length; i++) {
      if (arr[i] === arr[i - 1] && arr[i + 1] != null && newArr.indexOf(arr[i]) === -1) {
        newArr.push(arr[i]);
      }
    }
    return newArr;
  },

  square : function(arr) {
    newArr = []
    for (var i = 0; i < arr.length; i++) {
      newArr.push(arr[i] * arr[i]);
    }
    return newArr;
  },

  findAllOccurrences : function(arr, target) {
    indexArr = [];
    for (var i = 0; i < arr.length; i++) {
      if (arr[i] === target) indexArr.push(i);
    }
    return indexArr;
  }
};
