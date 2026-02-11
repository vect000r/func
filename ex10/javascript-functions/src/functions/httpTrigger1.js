const { app } = require("@azure/functions");

function multiply(num1, num2) {
    return num1 * num2
}

app.http("httpTrigger1", {
    methods: ["POST"],
    authLevel: "anonymous",
    handler: async (request, context) => {
        const { num1, num2 } = await request.json();

        return {
            status: 200,
            jsonBody: { product: multiply(num1, num2) },
        };
    },
});