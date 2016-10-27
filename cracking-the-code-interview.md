# Code

## Arrays: Left Rotation
_A left rotation operation on an array shifts each of the array's elements 1 unit to the left. Given an array and the number of left rotations print the updated array as a single line of space-separated integers._

```javascript
function main() {
    var n_temp = readLine().split(' ');
    var n = parseInt(n_temp[0]);
    var k = parseInt(n_temp[1]);
    a = readLine().split(' ');
    a = a.map(Number);
    
    let arr = []
    let output = "";
    for (index in a) {
        arr[index] = a[(Number(index) + k) % n]
        output+=`${arr[index]} `;
    }
    
    console.log(output.trim());
}
```

## Strings: Making Anagrams
_Given two strings that may or may not be of the same length, determine the minimum number of character deletions required to make them anagrams. Any characters can be deleted from either of the strings._

```javascript
function main() {
    let letters = "abcdefghijklmnopqrstuvwxyz".split("");
    let aCount = countLetters(letters, readLine().split(""));
    let bCount = countLetters(letters, readLine().split(""));
    let sum = 0;
    for (let i = 0; i < letters.length; i++) {
        sum+=Math.abs(aCount[i] - bCount[i]);
    }
    console.log(sum);
}

function countLetters(letters, arr) {
    let count = new Array(letters.length+1).join('0').split('').map(parseFloat);
    for (let index in arr) {
        let countIndex = letters.indexOf(arr[index]);
        if (countIndex != -1) {
            count[countIndex]++;
        }
    }
    return count;
}
```

### Hash Tables: Ransom Note
_Given the words in the magazine and the words in the ransom note, print `Yes` if you can replicate the ransom note exactly using whole words from the magazine; otherwise, print `No`._

```javascript
function main() {
    readLine();
    magazine = readLine().split(' ');
    magazineHash = {};
    ransom = readLine().split(' ');
    
    for (let index in magazine) {
        let word = magazine[index];
        if (word in magazineHash){
            magazineHash[word]++;
        } else {
            magazineHash[word] = 1; 
        }
    }
    
    console.log(enoughWords(ransom, magazineHash) ? "Yes" : "No")
}

function enoughWords(arr, hash) {
    for (index in arr) {
        let word = arr[index];
        if(word in hash) {
            hash[word]--;
            if (hash[word] == 0) {
                delete hash[word];
            } 
        } else {
            return false;
        }
    }
    
    return true;
}
```

### Stacks: Balanced Brackets
_Given `n` strings of brackets, determine whether each sequence of brackets is balanced. If a string is balanced, print `YES` on a new line; otherwise, print `NO` on a new line._

```javascript
function main() {
    var t = parseInt(readLine());
    let openBrackets = "([{";
    let bracketHash = {"(":")", "[":"]", "{":"}"}
    
    for(var a0 = 0; a0 < t; a0++){
        let exp = readLine().split("");
        let stack = []
        let balanced = true;
        let index = 0;
        
        while (balanced && index < exp.length) {
            let element = exp[index];
            if (openBrackets.includes(element)) {
                stack.push(element);
            } else if (bracketHash[stack.pop()] != element) {
                balanced = false;
            }
            index++;
        }
        
        if (stack.length != 0) {
            balanced = false;
        }
        
        console.log(balanced ? "YES" : "NO");
    }
}
```

### Queues: Two Stacks
_Implement a queue using two stacks and then do some operations._

```javascript
function processData(input) {
    let queue = new Queue();
    input = input.split("\n");
    let queries = input[0];
    
    for (let i = 1; i < input.length; i++) {
        let query = input[i].split(" ");
        if (query[0] == "1") {
            queue.enqueue(query[1]);
        } else if (query[0] == "2") {
            queue.dequeue();
        } else {
            queue.print();
        }
    }
}

var Queue = function() {
    this.inbox = [];
    this.outbox = [];
};

Queue.prototype.print = function() {
    this.fillOutbox();
    console.log(this.outbox[this.outbox.length-1]);
};

Queue.prototype.enqueue = function(element) {
    this.inbox.push(element);
};

Queue.prototype.dequeue = function() {
    this.fillOutbox();
    this.outbox.pop();
};

Queue.prototype.fillOutbox = function() {
    if (this.outbox.length == 0) {
        while (this.inbox.length > 0) {
            this.outbox.push(this.inbox.pop());
        }
    }
}
```
