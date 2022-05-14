FROM hashicorp/terraform:1.1.9

RUN apk --update add curl && rm -rf /var/cache/apk/*

# Install terragrunt from https://github.com/gruntwork-io/terragrunt
ENV TERRAGRUNT_VERSION=v0.36.7
RUN curl -L https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 > terragrunt && \
    mv terragrunt /usr/local/bin/terragrunt && \
    chmod +x /usr/local/bin/terragrunt

# Install tfsec from https://github.com/tfsec
ENV TFSEC_VERSION=v1.19.0
RUN curl -L https://github.com/tfsec/tfsec/releases/download/${TFSEC_VERSION}/tfsec-checkgen-linux-amd64 > tfsec-checkgen && \
    mv tfsec-checkgen /usr/local/bin/tfsec-checkgen && \
    chmod +x /usr/local/bin/tfsec-checkgen

RUN curl -L https://github.com/tfsec/tfsec/releases/download/${TFSEC_VERSION}/tfsec-linux-amd64 > tfsec && \
    mv tfsec /usr/local/bin/tfsec && \
    chmod +x /usr/local/bin/tfsec
