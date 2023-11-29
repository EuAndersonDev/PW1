const moduleOne = document.querySelector(".uncomplete-moduleOne")
const moduleTwo = document.querySelector(".uncomplete-moduleTwo")
const moduleThree = document.querySelector(".uncomplete-moduleThree")

const lineOne = document.querySelector(".line-one")
const lineTwo = document.querySelector(".line-two")

const One = document.querySelector(".One")
const Two = document.querySelector(".Two")
const Three = document.querySelector(".Three")

const teste = document.querySelector(".L-one")

var i = 0

teste.addEventListener("click", () => {
    if(i == 0){
        setTimeout(colorOne,1040)
        moduleOne.classList.toggle("complete-module")
        function colorOne(){
            One.classList.toggle("complete")
            moduleOne.classList.add("none")
            lineOne.classList.toggle("line-on")
            lineOne.classList.toggle("line-full")
            i = 1
        }
    }
    if(i == 1){
        setTimeout(colorTwo,1040)
        moduleTwo.classList.toggle("complete-module")
        function colorTwo(){
            Two.classList.toggle("complete")
            moduleTwo.classList.add("none")
            lineTwo.classList.toggle("line-on")
            lineTwo.classList.toggle("line-full")
            i = 2
        }
    }
    if(i == 2){
        setTimeout(colorOne,1040)
        moduleOne.classList.toggle("complete-module")
        function colorOne(){
            One.classList.toggle("complete")
            moduleOne.classList.add("none")
            lineOne.classList.toggle("line-on")
            lineOne.classList.toggle("line-full")
        }
    }
})