const NODE_ENV = Deno.env.get("NODE_ENV");

Deno.serve({port: 3000},(_req) => {
    return new Response(`NODE_ENV from env => ${NODE_ENV}`);
  });