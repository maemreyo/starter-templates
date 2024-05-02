import { sum, sumAsync } from './lib/sum';

const main: () => void = (): void => {
    console.log('Hello World!');
    console.log(sum(1, 2));
    console.log(sumAsync(1, 2));
};

main();
