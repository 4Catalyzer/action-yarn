FROM node:10-slim

LABEL version="1.0.0"
LABEL repository="https://github.com/4Catalyzer/action-yarn"
LABEL homepage="https://github.com/4Catalyzer/action-yarn"
LABEL maintainer="4Catalyzer"

LABEL com.github.actions.name="GitHub Action for npm"
LABEL com.github.actions.description="Wraps the npm CLI to enable common npm commands."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="red"
COPY LICENSE README.md THIRD_PARTY_NOTICE.md /

COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]
