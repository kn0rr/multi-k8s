const keys =require('./keys');
const redis=require('redis');

const redisClient= redis.createClient({
    host: keys.redisHost,
    port: keys.redisPort,
    retry_strategy: ()=>1000
});
//Watch redis and everytime get a message when a new number shows up!
const sub=redisClient.duplicate();

//Recursive solution here is not ideal (because really expenssive) but it works to show our usecase!)
function fib(index){
    if (index<2) return 1 ;
    return fib(index-1)+fib(index-2);
}
//Any time we get a new message run this callback function
sub.on('message', (channel,message)=>{
    //calculate a new fibonacci value and insert that into a hashset called values,
    //with the key "message" which is the index and push in the value for the fibonacci sequence we calculated
    redisClient.hset('values',message, fib(parseInt(message)))
})
//subscribe to any insert event
sub.subscribe('insert');