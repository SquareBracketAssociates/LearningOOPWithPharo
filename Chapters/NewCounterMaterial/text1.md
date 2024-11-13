
### Our use case


Here is our use case: we want to be able to create a counter, increment it twice, decrement it and check that its value is correct. It looks like this little use case will fit perfectly a unit test - you will define one later. 

```
| counter |
counter := Counter new.
counter increment; increment.
counter decrement.
counter count = 1
```

