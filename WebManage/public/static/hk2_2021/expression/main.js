function infixToPostfix(input) {
    var stack = [],
      answer = [],
      char;
    const operands = {
      "+": 1,
      "-": 1,
      "*": 2,
      "/": 2,
    };
  
    for (var char of input.split(" ")) {
      var currentPrecedence = operands[char];
  
      if (currentPrecedence) {
        var peek = operands[stack[stack.length - 1]];
        while (peek >= currentPrecedence) {
          answer.push(stack.pop());
          peek = operands[stack[stack.length - 1]];
        }
  
        stack.push(char);
      } else {
        answer.push(char);
      }
    }
  
    while (stack.length > 0) {
      answer.push(stack.pop());
    }
  
    return answer.join(" ");
  }
  
  function executePostfix(str) {
    var stack = [],
      operand1,
      operand2,
      tempOperand;
    var operators = ["+", "-", "*", "/"];
  
    for (var char of str.split(" ")) {
      if (operators.indexOf(char) >= 0) {
        operand2 = stack.pop();
        operand1 = stack.pop();
        tempOperand = eval(operand1 + char + operand2);
        stack.push(tempOperand);
      } else {
        stack.push(char);
      }
    }
    return stack.pop(); //do stack.pop la ket qua cuoi cung
  }
  
  function output() {
    var test = document.getElementById("bt").value;
    var expression = infixToPostfix(test);
    var answer = executePostfix(expression);
    document.getElementById("ketqua").textContent = answer;
  }
  //console.log(expression, '\n', answer);