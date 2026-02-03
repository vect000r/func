const { app } = require("@azure/functions");

function isPrime(num) {
    if ( num <= 1 ) return false;

    if ( num === 2) return false;

    if ( num % 2 === 0 ) return false;

    const limit = Math.sqrt(num);

    for (let i = 3; i <= limit; i += 2) {
        if (num % i === 0) return false;
    }

    return true;
}

app.http("function2", {
    methods: ["POST"],
    authLevel: "anonymous",
    handler: async (request, context) => {
        const { num } = await request.json();

        return {
            status: 200,
            jsonBody: { isZero: isZero(num) },
        };
    },
});