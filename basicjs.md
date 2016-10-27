# Basic JS Practice Code

### Loops
_Given a string composed of lowercase letters, print all the vowels together, followed by all the consonants, in the order that they appear in the string._

```javascript
function vowelsAndConsonants(s) {
    let vowels = "aeiou";
    let notVowels = "";
    
    for (let i = 0; i < s.length; i++) {
        if (vowels.includes(s[i])) {
            console.log(s[i]);
        } else {
            notVowels+=s[i];
        }
    }
    
    for (let i = 0; i < notVowels.length; i++) {
        console.log(notVowels[i]);
    } 
}
```

### Regular Expressions
_Given a string composed of lowercase letters, determine if the string begins and ends with the same vowel._

```javascript
var re = /^([aeiou]).*\1$/;
```

### Try, Catch, Finally, TypeOf

```javascript
function processData(my_string) {
    try {
        console.log(`Reversed string is : ${my_string.split("").reverse().join("")}`);
    } catch (err) {
        console.log(`Error : ${err.message}`);
    } finally {
        console.log(`Type of my_string is : ${typeof(my_string)}`);
    }
} 
```

### Throw

```javascript
function processData(my_height) {
    try {
        if (isNaN(my_height)) throw new Error("notANumberError");
        if (my_height > 10) throw new Error("hugeHeightError");
        if (my_height < 4) throw new Error("tinyHeightError");
        console.log(my_height);
    } catch (err) {
        console.log(err.message);
    }
} 
```

### Prototype

```javascript
function Square(A, B, C, D){
    this.A = A;
    this.B = B;
    this.C = C;
    this.D = D;
}

Square.prototype.isSquare = function() {
    console.log(this.A === this.B && this.B === this.C && this.C === this.D);
}
```

### Callback

```javascript
function myFilter(my_array, callback){
    var arr = []
    for (index in my_array) {
        let element = my_array[index];
        if (callback(element)) {
            arr.push(element);
        }
    }
    return arr;  
}

function processData(inputArray) {
    console.log(myFilter(inputArray, (x) => x % 2 == 0? true : false));   
}
```

### Sorting

```javascript
function sortLibrary() {
    library.sort(function (obj1, obj2) {
        return obj1.title > obj2.title;
    })
}
```

### Second largest in an array

```javascript
function processData(myArray) {
    if (myArray.length == 0) {
        return;
    }
    if (myArray.length == 1) {
        return myArray[0];
    }
    
    max = Math.max(myArray[0], myArray[1]);
    second = Math.min(myArray[0], myArray[1]);
    
    for (var i = 2; i < myArray.length; i++) {
        var element = myArray[i];
        if (max == second && element < max) {
            second = element;
        } else if (max == second && element > max) {
            max = element;
        } else if (element != max && element != second) {
            if (element > max) {
                second = max
                max = element
            } else if (element > second) {
                second = element;
            }
        }
    }
    console.log(second);
}
```

### Find Day

```javascript
function findDay(myDate) {
    // Return day for date myDate(MM/DD/YYYY)
    var daysOfWeek = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
    var dateInfo = myDate.split("/");
    var day = new Date(dateInfo[2], dateInfo[0]-1, dateInfo[1], 0, 0, 0, 0).getDay();
    
    console.log(daysOfWeek[day]);
} 
```

### Arrows

```javascript
var my_function = arr => arr.map(function(element) {
    return element % 2 == 0? ++element : --element;
});
```

### For ... Of

```javascript
for (let word of my_array) {
    if (word.split("").reverse().join("") === word) {
        console.log(word);
    }
}
```

### Boying Toys: Sort Example
_Mark wants to buy some toys. There are `n` different toys, tagged with their prices, but he has only `k` dollars. He wants to buy the maximum number of toys._

```javascript
function processData(input) {
    input = input.split("\n");
    let first = input[0].split(" ").map(element => Number(element));
    let totalToys = first.shift();
    let money = first.shift();

    let prices = input[1].split(" ").map(element => Number(element));
    prices = prices.sort(function(a, b){ return a-b});

    let spent = 0;
    let index = 0;

    while (prices[index] + spent <= money) {
        spent+=prices[index];
        index++;
    }
    
    console.log(index);
} 
```

### For loops
_The Utopian Tree goes through 2 cycles of growth every year. Each spring, it doubles in height. Each summer, its height increases by 1 meter._

```javascript
function main() {
    var t = parseInt(readLine());
    for(var a0 = 0; a0 < t; a0++){
        var n = parseInt(readLine());
        let height = 1;
        for (let i = 1; i <= n; i++) {
            if (i % 2 == 1) { 
                height*=2;
            } else {
                height+=1;
            }
        }
        console.log(height);
    }

}
```

### Connected Cells
_You are given a matrix containing 1s and 0s. Two cells are said to be connected if they are adjacent to each other horizontally, vertically, or diagonally. The connected and filled (i.e. cells that contain a 1) cells form a region. There may be several regions in the matrix. Find the number of cells in the largest region in the matrix._

```javascript
function processData(input) {
    input = input.replace(/\n/g, " ").split(" ")
    let rows = input.shift();
    let cols = input.shift();
    let regions = [];
      
    for (let i = 0; i < rows; i++) {
        for (let j = 0; j < cols; j++) { 
            if (input[i*cols+j].trim() == '1') {
                regions = updateRegions(regions, i, j);
            }
        }
    }
    
    let areas = regions.map(element => element.length);
    console.log(Math.max.apply(Math, areas));
} 

function updateRegions(regions, i, j) {
    let foundRIndex = -1;
    for (let rIndex in regions) {
        for (let subIndex in regions[rIndex]) {
            let iDiff = Math.abs(i - regions[rIndex][subIndex].i);
            let jDiff = Math.abs(j - regions[rIndex][subIndex].j);
            if (iDiff + jDiff == 1 || (iDiff == 1 && jDiff == 1)) {
                if (foundRIndex == -1) {
                    foundRIndex = rIndex;
                } else if(rIndex != foundRIndex) {
                    let piece = regions.splice(rIndex, 1)[0];
                    regions[foundRIndex] = regions[foundRIndex].concat(piece);
                    rIndex--;
                }
            }
        }
    }
    if (foundRIndex == -1) {
        regions.push([{i:i,j:j}]);
    } else {
        regions[foundRIndex].push({i:i,j:j});
    }
    return regions;
}
```

### Create palindrome
_For each test case, print a new line with the minimum number (as an integer) of operations required to convert the given string to a palindrome._

```javascript
function processData(input) {
    input = input.split("\n");
    numWords = Number(input.shift());
    
    for (let i = 0; i < numWords; i++) {
        let changes = 0;
        let word = input[i].split("");

        for(let index = 0; index < word.length / 2; index++) {
            changes+=Math.abs(word[index].charCodeAt(0) - word[word.length-1-index].charCodeAt(0));
        }
        
        console.log(changes);
    }
}
```
