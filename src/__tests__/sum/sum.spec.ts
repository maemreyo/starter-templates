import { sumAsync } from '../../lib/sum';

describe('sumAsync', () => {
    test('Sum of two positive numbers', async () => {
        const result = await sumAsync(3, 4);
        expect(result).toBe(7);
    });

    test('Sum of two negative numbers', async () => {
        const result = await sumAsync(-3, -4);
        expect(result).toBe(-7);
    });

    test('Sum of a positive and a negative number', async () => {
        const result = await sumAsync(3, -4);
        expect(result).toBe(-1);
    });

    test('Sum of zero and a number', async () => {
        const result = await sumAsync(0, 5);
        expect(result).toBe(5);
    });
});
