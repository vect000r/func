const { app } = require("@azure/functions");

function isZero(num) {
    return num === 0;
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