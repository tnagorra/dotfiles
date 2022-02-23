#!/usr/bin/env node

const args = process.argv.slice(2);
const [text = '', iterations = 5] = args;
for(let i = 0; i < iterations; i += 1) {
    console.log(text.toUpperCase().split('').join(' '.repeat(i)));
}
