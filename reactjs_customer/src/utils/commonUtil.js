

export const isNull = (value) => {
  return value === null;
};


export const isObject = (value) => {
  const type = typeof value;
  return value != null && (type === 'object' || type === 'function');
};


export const isEmpty = (obj) => {
  for (var key in obj) {
    if (obj.hasOwnProperty(key)) {
      return false;
    }
  }
  return true;
};

export const toUpper = (v, prev) => {
  if (v === prev) {
    return v;
  }
  return v && v.charAt(0).toUpperCase() + v.slice(1);
};

export const stringExplode = (str, delimiter) => {
  return str.split(delimiter);
};

export const convertStingToPascalCase = (str) => {
  return str
    .toLowerCase()
    .split(' ')
    .map((word) => {
      return word.charAt(0).toUpperCase() + word.slice(1);
    })
    .join(' ');
};

export const arrayCompare = (arr1, arr2) => {
  if (!arr1 || !arr2) return;
  let result;
  arr1.forEach((e1, i) =>
    arr2.forEach((e2) => {
      if (e1.length > 1 && e2.length) {
        result = arrayCompare(e1, e2);
      } else if (e1 !== e2) {
        result = false;
      } else {
        result = true;
      }
    })
  );
  return result;
};

export const stringCompare = (str1, str2) => {
  const string1 = !isEmpty(str1) ? str1.toString() : '';
  const string2 = !isEmpty(str2) ? str2.toString() : '';
  return string1 === string2;
};

export const objectCompare = (obj1, obj2) => {
  return JSON.stringify(obj1) === JSON.stringify(obj2);
};

export const isBase64 = (str, mimeRequired = true) => {
  if (str instanceof Boolean || typeof str === 'boolean' || str === '') {
    return false;
  }
  let regex =
    '(?:[A-Za-z0-9+\\/]{4})*(?:[A-Za-z0-9+\\/]{2}==|[A-Za-z0-9+/]{3}=)?';
  let mimeRegex = '(data:\\w+\\/[a-zA-Z\\+\\-\\.]+;base64,)';
  if (mimeRequired === true) {
    regex = mimeRegex + regex;
  }
  return new RegExp('^' + regex + '$', 'gi').test(str);
};

export const TableView = {
  MAIN_ID: 0,
  SYSTEM_EIDIT: 1,
  DATE_TIME_EIDIT: 2,
  ONLY_VIEW: 3,
  EDIT_DIRECTLY: 4,
  EIDIT_FROM: 5,
  EDIT_FROM_HTML: 6,
  STOP_EIDIT: 7,
  MAIN_ID_EDIT: 10,
  EIDIT_GET_ID_FROM_ANOTHER_TABLE: 11,
};

export const ActionControl = {
  NO_ACTION: 0,
  ACTION_ADD: 1,
  ACTION_UPDATE: 2,
  ACTION_DELETE: 3,
};

export const TypeDialgueShow = {
  NO_CHECK: 0,
  EDIT_TEXT: 1,
  EDIT_CUSTOM: 2,
  SELECT_TYPE: 3,
  SELECT_TABLE: 4,
  SELECT_CUSTOM: 5,
};


export const SelectHTml = {
  NOT_CHECK_HTML: 0,
  SelectPermision: 1,
  SelectGroupContentSub:2,
  SELECT_IMAGE_UP_LOAD:3,
  CUSTOMER_PERMISION: 4,
  
};

export const LOADING = {
  SHOW: 'SHOW_LOADING',
  HIDE: 'HIDE_LOADING',
};
