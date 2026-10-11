# =========================
# Build frontend
# =========================
FROM node:22-alpine AS builder

WORKDIR /app

RUN apk --no-cache add git

RUN git clone https://github.com/awalol/ds5dongle-config-web.git /app/

ARG UPSTREAM_SHA
RUN echo "$UPSTREAM_SHA"

RUN npm install
RUN npm run build

# =========================
# Runtime
# =========================
FROM nginx:alpine

RUN apk add --no-cache openssl

COPY --from=builder /app/dist /usr/share/nginx/html

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]