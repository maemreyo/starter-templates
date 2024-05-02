
export const sum = (a: number, b: number): number => a + b

export const sumAsync = async (a: number, b: number): Promise<number> => {
    return new Promise<number>((resolve) => {
        setTimeout(() => {
            resolve(a + b);
        }, 1000);
    });
}
