<p align="center">
  <a href="https://www.piloterr.com"><img src="images/banner.png" alt="Similarweb Scraper API by Piloterr – scrape Similarweb data as JSON" width="100%"></a>
</p>

# Similarweb Scraper API

[![Discord](https://img.shields.io/badge/Discord-Join%20the%20community-5865F2?logo=discord&logoColor=white)](https://discord.gg/CFj3ph8aHU) [![Get API key](https://img.shields.io/badge/Piloterr-Get%20a%20free%20API%20key-111827)](https://app.piloterr.com) [![API docs](https://img.shields.io/badge/Docs-OpenAPI-0EA5E9)](https://app.piloterr.com/openapi) [![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

The **Piloterr Similarweb Scraper API** lets you extract public data from Similarweb as **clean, structured JSON** — no proxies, headless browsers or HTML parsing to maintain. Endpoints available in production:

- **SimilarWeb Domain API** — Retrieve website traffic and engagement metrics for any domain from SimilarWeb, including visits, bounce rate, top keywords, and traffic sources.
- **Similarweb Search API** — Search the Similarweb database to retrieve websites, companies, mobile apps, search keywords, and technologies associated with a given domain or keyword.

Use it for lead generation, CRM enrichment, market mapping, investment research or job market analytics.

| Endpoint | Path | Credits | What you get |
|---|---|---|---|
| [SimilarWeb Domain API](#similarweb-domain-api) | `/v2/similarweb/domain` | 1 | Retrieve website traffic and engagement metrics for any domain from SimilarWeb, including visits, bounce rate, top keywords, and traffic sources. |
| [Similarweb Search API](#similarweb-search-api) | `/v2/similarweb/search` | 1 | Search the Similarweb database to retrieve websites, companies, mobile apps, search keywords, and technologies associated with a given domain or keyword. |

## Table of contents

- [How it works](#how-it-works)
- [SimilarWeb Domain API](#similarweb-domain-api)
- [Similarweb Search API](#similarweb-search-api)
- [Code examples in other languages](#code-examples-in-other-languages)
- [Practical use cases](#practical-use-cases)
- [Why Piloterr?](#why-piloterr)
- [FAQ](#faq)
- [Related scrapers](#related-scrapers)
- [Support](#support)

## How it works

1. **Create a free Piloterr account** and copy your API key from the [dashboard](https://app.piloterr.com).
2. **Send a `GET` (or `POST`) request** to `https://api.piloterr.com/v2/...` with the header `x-api-key: YOUR_API_KEY`.
3. **Receive structured JSON** — Piloterr handles rendering, proxies, retries and parsing.

```bash
export PILOTERR_API_KEY="your-api-key"
pip install requests        # Python
# TypeScript: Node.js 18+ (native fetch), run with `npx tsx file.ts`
```

> Every endpoint accepts both `GET` (query string) and `POST` (JSON body with the same fields).

## SimilarWeb Domain API

Retrieve website traffic and engagement metrics for any domain from SimilarWeb, including visits, bounce rate, top keywords, and traffic sources.

`GET | POST https://api.piloterr.com/v2/similarweb/domain` · **1 credit per request** · [Full reference](https://app.piloterr.com/openapi)

### Request parameters

| Parameter | Type | Required | Description |
|---|---|---|---|
| `query` | string | ✅ | A domain name to retrieve traffic and engagement metrics for. |

### Python example

```python
import json
import os
import requests

response = requests.get(
    "https://api.piloterr.com/v2/similarweb/domain",
    headers={"x-api-key": os.environ["PILOTERR_API_KEY"]},
    params={
        "query": "google.com",
    },
    timeout=120,
)
response.raise_for_status()
data = response.json()

print(json.dumps(data, indent=2, ensure_ascii=False)[:2000])
```

### TypeScript example

```typescript
type SimilarwebDomain = {
  title?: string;
  category?: string;
  site_name?: string;
  engagments?: {
    year?: string;
    month?: string;
    visits?: string;
    bounce_rate?: string;
    time_on_site?: string;
    page_per_visit?: string;
  };
  global_rank?: {
    rank?: number;
  };
  country_rank?: {
    rank?: number;
    country?: number;
    country_code?: string;
  };
  top_keywords?: {
    cpc?: number;
    name?: string;
    volume?: number;
    estimated_value?: number;
  }[];
  category_rank?: {
    rank?: string;
    category?: string;
  };
  snapshot_date?: string;
  traffic_sources?: {
    mail?: number;
    direct?: number;
    search?: number;
    social?: number;
    referrals?: number;
    paid_referrals?: number;
  };
  large_screenshot?: string;
  top_country_shares?: {
    value?: number;
    country?: number;
    country_code?: string;
  }[];
};

const params = new URLSearchParams({
  "query": "google.com",
});

const response = await fetch(`https://api.piloterr.com/v2/similarweb/domain?${params}`, {
  headers: { "x-api-key": process.env.PILOTERR_API_KEY! },
});
if (!response.ok) throw new Error(`Piloterr error ${response.status}: ${await response.text()}`);

const data = (await response.json()) as SimilarwebDomain;

console.log(JSON.stringify(data, null, 2).slice(0, 2000));
```

<details>
<summary><b>POST variant</b></summary>

```http
POST https://api.piloterr.com/v2/similarweb/domain
x-api-key: YOUR_API_KEY
Content-Type: application/json

{"query": "google.com"}
```
</details>

### Output example

Example response from the API reference, abridged — real values depend on the page you scrape.

```json
{
  "title": "",
  "category": "computers_electronics_and_technology/search_engines",
  "site_name": "google.com",
  "engagments": {
    "year": "2024",
    "month": "5",
    "visits": "86249524745",
    "bounce_rate": "0.28024037791407225",
    "time_on_site": "641.4282025756406",
    "page_per_visit": "8.752416969603086"
  },
  "global_rank": {
    "rank": 1
  },
  "country_rank": {
    "rank": 1,
    "country": 840,
    "country_code": "US"
  },
  "top_keywords": [
    {
      "cpc": 1.08870175,
      "name": "gmail",
      "volume": 107944750,
      "estimated_value": 16490414
    },
    {
      "cpc": 0.7102735625,
      "name": "google",
      "volume": 69586760,
      "estimated_value": 6776722
    }
  ],
  "category_rank": {
    "rank": "1",
    "category": "Computers_Electronics_and_Technology/Search_Engines"
  },
  "snapshot_date": "2024-05-01T00:00:00+00:00",
  "traffic_sources": {
    "mail": 0.0017641,
    "direct": 0.9503452,
    "search": 0.00488378,
    "social": 0.0209163,
    "referrals": 0.0214876,
    "paid_referrals": 0.000602931
  },
  "large_screenshot": "https://site-images.similarcdn.com/image?url=google.com&t=1&s=1&h=eb35e0fbafa3eb290132ffdfe47187d950d68daaa659ec1bd4b4e834b8f16461",
  "top_country_shares": [
    {
      "value": 0.2648986,
      "country": 840,
      "country_code": "US"
    },
    {
      "value": 0.045608,
      "country": 356,
      "country_code": "IN"
    }
  ]
}
```

### Response fields

| Field | Type | Description |
|---|---|---|
| `title` | string |  |
| `category` | string |  |
| `site_name` | string |  |
| `engagments` | object |  |
| `engagments.year` | string |  |
| `engagments.month` | string |  |
| `engagments.visits` | string |  |
| `engagments.bounce_rate` | string |  |
| `engagments.time_on_site` | string |  |
| `engagments.page_per_visit` | string |  |
| `global_rank` | object |  |
| `global_rank.rank` | integer |  |
| `country_rank` | object |  |
| `country_rank.rank` | integer |  |
| `country_rank.country` | integer |  |
| `country_rank.country_code` | string |  |
| `top_keywords[]` | object[] |  |
| `top_keywords[].cpc` | number |  |
| `top_keywords[].name` | string |  |
| `top_keywords[].volume` | integer |  |
| `top_keywords[].estimated_value` | integer |  |
| `category_rank` | object |  |
| `category_rank.rank` | string |  |
| `category_rank.category` | string |  |
| `snapshot_date` | string |  |

## Similarweb Search API

Search the Similarweb database to retrieve websites, companies, mobile apps, search keywords, and technologies associated with a given domain or keyword.

`GET | POST https://api.piloterr.com/v2/similarweb/search` · **1 credit per request** · [Full reference](https://app.piloterr.com/openapi)

### Request parameters

| Parameter | Type | Required | Description |
|---|---|---|---|
| `query` | string | ✅ | Domain name or keyword to search for in the Similarweb database. |

### Python example

```python
import json
import os
import requests

response = requests.get(
    "https://api.piloterr.com/v2/similarweb/search",
    headers={"x-api-key": os.environ["PILOTERR_API_KEY"]},
    params={
        "query": "google.com",
    },
    timeout=120,
)
response.raise_for_status()
data = response.json()

print(json.dumps(data, indent=2, ensure_ascii=False)[:2000])
```

### TypeScript example

```typescript
type SimilarwebSearch = {
  apps?: {
    appStore?: unknown[];
    googlePlay?: unknown[];
  };
  keywords?: string[];
  websites?: {
    name?: string;
    image?: string;
    isVirtual?: boolean;
  }[];
  companies?: unknown[];
  technologies?: unknown[];
};

const params = new URLSearchParams({
  "query": "google.com",
});

const response = await fetch(`https://api.piloterr.com/v2/similarweb/search?${params}`, {
  headers: { "x-api-key": process.env.PILOTERR_API_KEY! },
});
if (!response.ok) throw new Error(`Piloterr error ${response.status}: ${await response.text()}`);

const data = (await response.json()) as SimilarwebSearch;

console.log(JSON.stringify(data, null, 2).slice(0, 2000));
```

<details>
<summary><b>POST variant</b></summary>

```http
POST https://api.piloterr.com/v2/similarweb/search
x-api-key: YOUR_API_KEY
Content-Type: application/json

{"query": "google.com"}
```
</details>

### Output example

Example response from the API reference, abridged — real values depend on the page you scrape.

```json
{
  "apps": {
    "appStore": [],
    "googlePlay": []
  },
  "keywords": [
    "google",
    "google translate"
  ],
  "websites": [
    {
      "name": "google.com",
      "image": "https://site-images.similarcdn.com/image?url=google.com&t=2&s=1&h=eb35e0fbafa3eb290132ffdfe47187d950d68daaa659ec1bd4b4e834b8f16461",
      "isVirtual": false
    },
    {
      "name": "google.com.br",
      "image": "https://site-images.similarcdn.com/image?url=google.com.br&t=2&s=1&h=f504c8926f9f375805be71b441f7e0075edd929c948130d744438f373adaf17c",
      "isVirtual": false
    }
  ],
  "companies": [],
  "technologies": []
}
```

### Response fields

| Field | Type | Description |
|---|---|---|
| `apps` | object |  |
| `apps.appStore` | any[] |  |
| `apps.googlePlay` | any[] |  |
| `keywords` | string[] |  |
| `websites[]` | object[] |  |
| `websites[].name` | string |  |
| `websites[].image` | string |  |
| `websites[].isVirtual` | boolean |  |
| `companies` | any[] |  |
| `technologies` | any[] |  |

## Code examples in other languages

Ready-to-run examples live in the [`examples/`](examples) folder. Each one reads your key from the `PILOTERR_API_KEY` environment variable.

| Language | SimilarWeb Domain | Search |
|---|---|---|
| cURL (Bash) | [`domain`](examples/curl/domain.sh) | [`search`](examples/curl/search.sh) |
| PHP | [`domain`](examples/php/domain.php) | [`search`](examples/php/search.php) |
| C# | [`domain`](examples/csharp/Domain.cs) | [`search`](examples/csharp/Search.cs) |
| Go | [`domain`](examples/go/domain.go) | [`search`](examples/go/search.go) |
| Java | [`domain`](examples/java/DomainExample.java) | [`search`](examples/java/SearchExample.java) |
| Ruby | [`domain`](examples/ruby/domain.rb) | [`search`](examples/ruby/search.rb) |
| Node.js | [`domain`](examples/nodejs/domain.mjs) | [`search`](examples/nodejs/search.mjs) |

## Practical use cases

- **Lead generation** — Build target account lists from public company data.
- **CRM enrichment** — Keep firmographics, websites and descriptions up to date.
- **Market mapping** — Map competitors and segments across countries and industries.
- **Investment research** — Screen companies, funding and signals for deal flow.
- **Job market analytics** — Track hiring, roles and salaries where available.

## Why Piloterr?

- **No infrastructure** — no proxies, headless browsers or CAPTCHA solving to run yourself.
- **Structured JSON** — stable, documented fields instead of brittle HTML selectors.
- **Pay per request** — transparent credit cost per endpoint, failed requests are retried for you.
- **One API key, hundreds of sources** — Similarweb plus many other e-commerce, search and company data endpoints in the [Piloterr library](https://www.piloterr.com/library).
- **Any language** — plain HTTPS + JSON, with examples for Python, TypeScript, cURL, PHP, C#, Go, Java, Ruby and Node.js.

## FAQ

### Is it legal to scrape Similarweb?

Collecting publicly available data is generally allowed in many jurisdictions, but rules depend on your country, the data you collect and how you use it. Avoid personal data unless you have a lawful basis, respect the website's terms where they apply, and get legal advice for your specific use case. This is not legal advice.

### Do I need proxies or a headless browser?

No. Piloterr handles rendering, proxy rotation and retries on its side. You only send an HTTPS request with your `x-api-key` header and receive JSON.

### How much does a request cost?

Credits per call: `/v2/similarweb/domain` **1**, `/v2/similarweb/search` **1**. See the [Piloterr website](https://www.piloterr.com) for plans.

### What data does the Similarweb API return?

Each endpoint returns structured JSON: **SimilarWeb Domain** — `title`, `category`, `site_name`, `engagments`, `engagments.year`, `engagments.month`; **Similarweb Search** — `apps`, `apps.appStore`, `apps.googlePlay`, `keywords`, `websites[]`, `websites[].name`.

### Which languages are supported?

Any language that can make an HTTP request. This README shows Python and TypeScript; the [`examples/`](examples) folder contains cURL, PHP, C#, Go, Java, Ruby and Node.js.

## Related scrapers

- [Company Database Scraper API](https://github.com/piloterr/company-data-api)
- [Crunchbase Scraper API](https://github.com/piloterr/crunchbase-scraper)
- [Europages Scraper API](https://github.com/piloterr/europages-scraper)
- [Fiverr Scraper API](https://github.com/piloterr/fiverr-scraper)
- [G2 Scraper API](https://github.com/piloterr/g2-scraper)
- [GitHub Scraper API](https://github.com/piloterr/github-scraper)
- [All Piloterr scrapers on GitHub](https://github.com/piloterr)

## Support

- 💬 Join the [Piloterr Discord](https://discord.gg/CFj3ph8aHU) to ask questions and share what you build.
- 📚 Browse the [API reference (OpenAPI)](https://app.piloterr.com/openapi) and the [Piloterr library](https://www.piloterr.com/library).
- 🔑 [Get your API key](https://app.piloterr.com).

---

<p align="center">
  <a href="https://www.piloterr.com">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="images/logo-dark.svg">
      <img src="images/logo.svg" alt="Piloterr" height="32">
    </picture>
  </a>
  <br>
  <sub>Built by <a href="https://www.piloterr.com">Piloterr</a> — web scraping APIs for e-commerce, search, real estate and more, one API key.</sub>
</p>

<sub>Similarweb is a trademark of its respective owner. This repository is not affiliated with or endorsed by Similarweb. Examples are released under the MIT license.</sub>
