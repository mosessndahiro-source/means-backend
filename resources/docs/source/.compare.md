---
title: API Reference

language_tabs:
- javascript

includes:

search: true

toc_footers:
- <a href='http://github.com/mpociot/documentarian'>Documentation Powered by Documentarian</a>
---
<!-- START_INFO -->
# Info

Welcome to the generated API reference.

<!-- END_INFO -->

#Auth


APIs for authentication
<!-- START_05065df8530149e07c75a326f6a7b876 -->
## Check if user exist

> Example request:

```javascript
const url = new URL(
    "http://localhost/clipx/public/api/check-user"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

let body = {
    "mobile_number": "autem"
}

fetch(url, {
    method: "POST",
    headers: headers,
    body: body
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "message": "User exists"
}
```
> Example response (422):

```json
{
    "message": "The given data was invalid.",
    "errors": {
        "mobile_number": [
            "The selected mobile number is invalid."
        ]
    }
}
```

### HTTP Request
`POST api/check-user`

#### Body Parameters
Parameter | Type | Status | Description
--------- | ------- | ------- | ------- | -----------
    `mobile_number` | string |  required  | Mobile Number to check. Example +912324252627
    
<!-- END_05065df8530149e07c75a326f6a7b876 -->

<!-- START_c3fa189a6c95ca36ad6ac4791a873d23 -->
## Login

> Example request:

```javascript
const url = new URL(
    "http://localhost/clipx/public/api/login"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

let body = {
    "token": "firebase_token",
    "role": "customer"
}

fetch(url, {
    method: "POST",
    headers: headers,
    body: body
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMDVlY2Q3ZjlkOWIxNTBhOGY4NjdkMzNmM2E5ZjM2MGZjOTA2MTBiZDJhZDQ3ODg5ZTU2M2IzNjNiMmY1OGM5NWZlYTBiNzZmNTFlMTJkNzYiLCJpYXQiOjE1OTAxODUwODEsIm5iZiI6MTU5MDE4NTA4MSwiZXhwIjoxNjIxNzIxMDgxLCJzdWIiOiI0Iiwic2NvcGVzIjpbXX0.P3rDECO0rjsF08w-yt6B39oEJfxhoO47yzSjP0xLsdGYLMeziQ0SrZhkVd8G-Z6Oaob5Yp0l_P9rUsGDcsBl5mS2ujjQxKV3SdQk-PRto4FdzCvP3x6Cetmm1yHpBK2KHfdafiYL1zigY-sM4dQpijUb8HoHIy0aff6SSQK6R9oH2uLCjN7xi4A8OrCA43ycD8rRdG6J1U84MuItergICRsxGK9iezcRLf3-hM56YZDUvsbCPBjLLA1D7iovjeg2fIr4fLhQLyjoS3g-juhIuERuuz_VVHyfS0a382cwnMfkIG24h_2sguv3es0PtBQTmRlnxY5nb6gLsPnzUhtqJLJ2qIL134Wl4CbNcKe0JaCTpNnh6TgYeESDPTbfiX3GFPZCplVKLZIzxND3ac5_OviVVY3hAOHM6Lshz-At7cEnBYXn8aqi3lmmriZKWD-7SwzV0Q-CCQ9RqMDdgs6sTpJM-ZTZ8IwKAt_dsLcvSPiIA3DiMEKz-xT8qf7ubj-qW08C2x1iw3ieuBk7gvYF1JhyYfGKt6pId3Hbh2xSQa9P1VW1GE7vRH-iDaPhaRnrloXP01OFP9wQU5vpME5iaKRPYCwpIKNmwc5uPjeHRg8ORcQGfz_mm1v7PGF09RTTa-AcDZbHOVdtYFGbX7pnbSSCkY17aANe-W-bbS7orGM",
    "user": {
        "id": 4,
        "name": "Test Customer",
        "email": "test@exampl.com",
        "mobile_number": "+911312121213",
        "mobile_verified": 0,
        "active": 1,
        "language": "en",
        "notification": null,
        "meta": null,
        "remember_token": null,
        "created_at": "2020-05-22 22:04:40",
        "updated_at": "2020-05-22 22:04:40"
    }
}
```
> Example response (422):

```json
{
    "message": "The given data was invalid.",
    "errors": {
        "token": [
            "The token field is required."
        ]
    }
}
```

### HTTP Request
`POST api/login`

#### Body Parameters
Parameter | Type | Status | Description
--------- | ------- | ------- | ------- | -----------
    `token` | string |  required  | Firebase token.
        `role` | string |  required  | Role of the user logging in.
    
<!-- END_c3fa189a6c95ca36ad6ac4791a873d23 -->

<!-- START_d7b7952e7fdddc07c978c9bdaf757acf -->
## Register

> Example request:

```javascript
const url = new URL(
    "http://localhost/clipx/public/api/register"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

let body = {
    "name": "John",
    "email": "john@example.com",
    "mobile_number": "+912324252627",
    "image_url": "https:\/\/via.placeholder.com\/50",
    "role": "customer"
}

fetch(url, {
    method: "POST",
    headers: headers,
    body: body
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMDVlY2Q3ZjlkOWIxNTBhOGY4NjdkMzNmM2E5ZjM2MGZjOTA2MTBiZDJhZDQ3ODg5ZTU2M2IzNjNiMmY1OGM5NWZlYTBiNzZmNTFlMTJkNzYiLCJpYXQiOjE1OTAxODUwODEsIm5iZiI6MTU5MDE4NTA4MSwiZXhwIjoxNjIxNzIxMDgxLCJzdWIiOiI0Iiwic2NvcGVzIjpbXX0.P3rDECO0rjsF08w-yt6B39oEJfxhoO47yzSjP0xLsdGYLMeziQ0SrZhkVd8G-Z6Oaob5Yp0l_P9rUsGDcsBl5mS2ujjQxKV3SdQk-PRto4FdzCvP3x6Cetmm1yHpBK2KHfdafiYL1zigY-sM4dQpijUb8HoHIy0aff6SSQK6R9oH2uLCjN7xi4A8OrCA43ycD8rRdG6J1U84MuItergICRsxGK9iezcRLf3-hM56YZDUvsbCPBjLLA1D7iovjeg2fIr4fLhQLyjoS3g-juhIuERuuz_VVHyfS0a382cwnMfkIG24h_2sguv3es0PtBQTmRlnxY5nb6gLsPnzUhtqJLJ2qIL134Wl4CbNcKe0JaCTpNnh6TgYeESDPTbfiX3GFPZCplVKLZIzxND3ac5_OviVVY3hAOHM6Lshz-At7cEnBYXn8aqi3lmmriZKWD-7SwzV0Q-CCQ9RqMDdgs6sTpJM-ZTZ8IwKAt_dsLcvSPiIA3DiMEKz-xT8qf7ubj-qW08C2x1iw3ieuBk7gvYF1JhyYfGKt6pId3Hbh2xSQa9P1VW1GE7vRH-iDaPhaRnrloXP01OFP9wQU5vpME5iaKRPYCwpIKNmwc5uPjeHRg8ORcQGfz_mm1v7PGF09RTTa-AcDZbHOVdtYFGbX7pnbSSCkY17aANe-W-bbS7orGM",
    "user": {
        "id": 4,
        "name": "Test Customer",
        "email": "test@exampl.com",
        "mobile_number": "+911312121213",
        "mobile_verified": 0,
        "active": 1,
        "language": "en",
        "notification": null,
        "meta": null,
        "remember_token": null,
        "created_at": "2020-05-22 22:04:40",
        "updated_at": "2020-05-22 22:04:40"
    }
}
```
> Example response (422):

```json
{
    "message": "The given data was invalid.",
    "errors": {
        "name": [
            "The name field is required."
        ],
        "email": [
            "The email field is required."
        ],
        "mobile_number": [
            "The mobile number has already been taken."
        ],
        "role": [
            "The role field is required."
        ]
    }
}
```

### HTTP Request
`POST api/register`

#### Body Parameters
Parameter | Type | Status | Description
--------- | ------- | ------- | ------- | -----------
    `name` | string |  required  | Name of user.
        `email` | string |  required  | Email of user.
        `mobile_number` | string |  required  | Mobile Number of user.
        `image_url` | string |  optional  | Image url for profie picture.
        `role` | string |  required  | Role of user.
    
<!-- END_d7b7952e7fdddc07c978c9bdaf757acf -->

<!-- START_2d5664cb1301ddad0673ca0f2c6bee60 -->
## Verifies user&#039;s mobile

> Example request:

```javascript
const url = new URL(
    "http://localhost/clipx/public/api/verify-mobile"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

let body = {
    "mobile_number": "+912324252627"
}

fetch(url, {
    method: "POST",
    headers: headers,
    body: body
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMDVlY2Q3ZjlkOWIxNTBhOGY4NjdkMzNmM2E5ZjM2MGZjOTA2MTBiZDJhZDQ3ODg5ZTU2M2IzNjNiMmY1OGM5NWZlYTBiNzZmNTFlMTJkNzYiLCJpYXQiOjE1OTAxODUwODEsIm5iZiI6MTU5MDE4NTA4MSwiZXhwIjoxNjIxNzIxMDgxLCJzdWIiOiI0Iiwic2NvcGVzIjpbXX0.P3rDECO0rjsF08w-yt6B39oEJfxhoO47yzSjP0xLsdGYLMeziQ0SrZhkVd8G-Z6Oaob5Yp0l_P9rUsGDcsBl5mS2ujjQxKV3SdQk-PRto4FdzCvP3x6Cetmm1yHpBK2KHfdafiYL1zigY-sM4dQpijUb8HoHIy0aff6SSQK6R9oH2uLCjN7xi4A8OrCA43ycD8rRdG6J1U84MuItergICRsxGK9iezcRLf3-hM56YZDUvsbCPBjLLA1D7iovjeg2fIr4fLhQLyjoS3g-juhIuERuuz_VVHyfS0a382cwnMfkIG24h_2sguv3es0PtBQTmRlnxY5nb6gLsPnzUhtqJLJ2qIL134Wl4CbNcKe0JaCTpNnh6TgYeESDPTbfiX3GFPZCplVKLZIzxND3ac5_OviVVY3hAOHM6Lshz-At7cEnBYXn8aqi3lmmriZKWD-7SwzV0Q-CCQ9RqMDdgs6sTpJM-ZTZ8IwKAt_dsLcvSPiIA3DiMEKz-xT8qf7ubj-qW08C2x1iw3ieuBk7gvYF1JhyYfGKt6pId3Hbh2xSQa9P1VW1GE7vRH-iDaPhaRnrloXP01OFP9wQU5vpME5iaKRPYCwpIKNmwc5uPjeHRg8ORcQGfz_mm1v7PGF09RTTa-AcDZbHOVdtYFGbX7pnbSSCkY17aANe-W-bbS7orGM",
    "user": {
        "id": 4,
        "name": "Test Customer",
        "email": "test@exampl.com",
        "mobile_number": "+911312121213",
        "mobile_verified": 0,
        "active": 1,
        "language": "en",
        "notification": null,
        "meta": null,
        "remember_token": null,
        "created_at": "2020-05-22 22:04:40",
        "updated_at": "2020-05-22 22:04:40"
    }
}
```
> Example response (200):

```json
{
    "message": "The given data was invalid.",
    "errors": {
        "mobile_number": [
            "The selected mobile number is invalid."
        ]
    }
}
```

### HTTP Request
`POST api/verify-mobile`

#### Body Parameters
Parameter | Type | Status | Description
--------- | ------- | ------- | ------- | -----------
    `mobile_number` | string |  required  | Mobile Number to verify.
    
<!-- END_2d5664cb1301ddad0673ca0f2c6bee60 -->

<!-- START_444008ca6541ddc5d3dae8434120a6d1 -->
## Social Login

> Example request:

```javascript
const url = new URL(
    "http://localhost/clipx/public/api/social/login"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

let body = {
    "platform": "google,facebook,apple",
    "token": "social_token",
    "os": "android, ios",
    "role": "customer"
}

fetch(url, {
    method: "POST",
    headers: headers,
    body: body
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMDVlY2Q3ZjlkOWIxNTBhOGY4NjdkMzNmM2E5ZjM2MGZjOTA2MTBiZDJhZDQ3ODg5ZTU2M2IzNjNiMmY1OGM5NWZlYTBiNzZmNTFlMTJkNzYiLCJpYXQiOjE1OTAxODUwODEsIm5iZiI6MTU5MDE4NTA4MSwiZXhwIjoxNjIxNzIxMDgxLCJzdWIiOiI0Iiwic2NvcGVzIjpbXX0.P3rDECO0rjsF08w-yt6B39oEJfxhoO47yzSjP0xLsdGYLMeziQ0SrZhkVd8G-Z6Oaob5Yp0l_P9rUsGDcsBl5mS2ujjQxKV3SdQk-PRto4FdzCvP3x6Cetmm1yHpBK2KHfdafiYL1zigY-sM4dQpijUb8HoHIy0aff6SSQK6R9oH2uLCjN7xi4A8OrCA43ycD8rRdG6J1U84MuItergICRsxGK9iezcRLf3-hM56YZDUvsbCPBjLLA1D7iovjeg2fIr4fLhQLyjoS3g-juhIuERuuz_VVHyfS0a382cwnMfkIG24h_2sguv3es0PtBQTmRlnxY5nb6gLsPnzUhtqJLJ2qIL134Wl4CbNcKe0JaCTpNnh6TgYeESDPTbfiX3GFPZCplVKLZIzxND3ac5_OviVVY3hAOHM6Lshz-At7cEnBYXn8aqi3lmmriZKWD-7SwzV0Q-CCQ9RqMDdgs6sTpJM-ZTZ8IwKAt_dsLcvSPiIA3DiMEKz-xT8qf7ubj-qW08C2x1iw3ieuBk7gvYF1JhyYfGKt6pId3Hbh2xSQa9P1VW1GE7vRH-iDaPhaRnrloXP01OFP9wQU5vpME5iaKRPYCwpIKNmwc5uPjeHRg8ORcQGfz_mm1v7PGF09RTTa-AcDZbHOVdtYFGbX7pnbSSCkY17aANe-W-bbS7orGM",
    "user": {
        "id": 4,
        "name": "Test Customer",
        "email": "test@exampl.com",
        "mobile_number": "+911312121213",
        "mobile_verified": 0,
        "active": 1,
        "language": "en",
        "notification": null,
        "meta": null,
        "remember_token": null,
        "created_at": "2020-05-22 22:04:40",
        "updated_at": "2020-05-22 22:04:40"
    }
}
```
> Example response (400):

```json
{
    "message": "Email not found from token"
}
```
> Example response (404):

```json
{
    "message": "User does not exist",
    "name": "John",
    "email": "john@example.com"
}
```
> Example response (422):

```json
{
    "message": "The given data was invalid.",
    "errors": {
        "platform": [
            "The platform field is required."
        ],
        "token": [
            "The token field is required."
        ],
        "os": [
            "The os field is required."
        ],
        "role": [
            "The role field is required."
        ]
    }
}
```

### HTTP Request
`POST api/social/login`

#### Body Parameters
Parameter | Type | Status | Description
--------- | ------- | ------- | ------- | -----------
    `platform` | string |  required  | Platform.
        `token` | string |  required  | Token.
        `os` | string |  required  | Current OS.
        `role` | string |  required  | Role fo the user logging in.
    
<!-- END_444008ca6541ddc5d3dae8434120a6d1 -->

#Settings


APIs for settings
<!-- START_10633908636252dc838d3a5bd392f07c -->
## api/settings
> Example request:

```javascript
const url = new URL(
    "http://localhost/clipx/public/api/settings"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
[
    {
        "id": 1,
        "key": "currency_code",
        "value": "USD",
        "type": "string"
    },
    {
        "id": 2,
        "key": "currency_icon",
        "value": "$",
        "type": "string"
    },
    {
        "id": 3,
        "key": "support_email",
        "value": "admin@example.com",
        "type": "string"
    },
    {
        "id": 4,
        "key": "support_phone",
        "value": "8181818118",
        "type": "string"
    },
    {
        "id": 5,
        "key": "privacy_policy",
        "value": "Demo privacy policy",
        "type": "string"
    },
    {
        "id": 6,
        "key": "about_us",
        "value": "Demo privacy policy",
        "type": "string"
    },
    {
        "id": 7,
        "key": "terms",
        "value": "Demo Terms and Condition",
        "type": "string"
    }
]
```

### HTTP Request
`GET api/settings`


<!-- END_10633908636252dc838d3a5bd392f07c -->

#User Management


APIs for user management
<!-- START_2b6e5a4b188cb183c7e59558cce36cb6 -->
## api/user
> Example request:

```javascript
const url = new URL(
    "http://localhost/clipx/public/api/user"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/user`


<!-- END_2b6e5a4b188cb183c7e59558cce36cb6 -->

<!-- START_00f7d0be1226887c1ffa251c97c8740a -->
## api/user
> Example request:

```javascript
const url = new URL(
    "http://localhost/clipx/public/api/user"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "PUT",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`PUT api/user`


<!-- END_00f7d0be1226887c1ffa251c97c8740a -->

<!-- START_6cf43c3b8417255ad54be725e20696e9 -->
## api/user/wallet/balance
> Example request:

```javascript
const url = new URL(
    "http://localhost/clipx/public/api/user/wallet/balance"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/user/wallet/balance`


<!-- END_6cf43c3b8417255ad54be725e20696e9 -->

<!-- START_acd7c544a223b90e3057aa248bf06b27 -->
## api/user/wallet/transactions
> Example request:

```javascript
const url = new URL(
    "http://localhost/clipx/public/api/user/wallet/transactions"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/user/wallet/transactions`


<!-- END_acd7c544a223b90e3057aa248bf06b27 -->

<!-- START_30cebd5eb92f8ada56ac94320d690575 -->
## api/user/wallet/payout
> Example request:

```javascript
const url = new URL(
    "http://localhost/clipx/public/api/user/wallet/payout"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/user/wallet/payout`


<!-- END_30cebd5eb92f8ada56ac94320d690575 -->

<!-- START_41838b2636109f5ce07d14c340a680d0 -->
## api/user/wallet/earnings
> Example request:

```javascript
const url = new URL(
    "http://localhost/clipx/public/api/user/wallet/earnings"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/user/wallet/earnings`


<!-- END_41838b2636109f5ce07d14c340a680d0 -->

#general


<!-- START_403a8192e36a269247d3863add04d8df -->
## api/artisan/command
> Example request:

```javascript
const url = new URL(
    "http://localhost/clipx/public/api/artisan/command"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/artisan/command`


<!-- END_403a8192e36a269247d3863add04d8df -->

<!-- START_109013899e0bc43247b0f00b67f889cf -->
## api/categories
> Example request:

```javascript
const url = new URL(
    "http://localhost/clipx/public/api/categories"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "data": [
        {
            "id": 1,
            "slug": "movie",
            "title": "Movies",
            "meta": null,
            "sort_order": 1,
            "mediaurls": [],
            "parent_id": null
        },
        {
            "id": 2,
            "slug": "comedy",
            "title": "Comedy",
            "meta": {
                "color": "#6fe6db"
            },
            "sort_order": 1,
            "mediaurls": [],
            "parent_id": 1
        },
        {
            "id": 5,
            "slug": "tv",
            "title": "Tv Shows",
            "meta": null,
            "sort_order": 1,
            "mediaurls": [],
            "parent_id": null
        },
        {
            "id": 6,
            "slug": "comedy",
            "title": "Comedy",
            "meta": {
                "color": "#887155"
            },
            "sort_order": 1,
            "mediaurls": [],
            "parent_id": 5
        },
        {
            "id": 3,
            "slug": "drama",
            "title": "Drama",
            "meta": {
                "color": "#7883c4"
            },
            "sort_order": 2,
            "mediaurls": [],
            "parent_id": 1
        },
        {
            "id": 7,
            "slug": "drama",
            "title": "Drama",
            "meta": {
                "color": "#2a6760"
            },
            "sort_order": 2,
            "mediaurls": [],
            "parent_id": 5
        },
        {
            "id": 4,
            "slug": "action",
            "title": "Action",
            "meta": {
                "color": "#fb8b71"
            },
            "sort_order": 3,
            "mediaurls": [],
            "parent_id": 1
        },
        {
            "id": 8,
            "slug": "action",
            "title": "Action",
            "meta": {
                "color": "#eb5d88"
            },
            "sort_order": 3,
            "mediaurls": [],
            "parent_id": 5
        }
    ],
    "links": {
        "first": "http:\/\/localhost\/api\/categories?page=1",
        "last": "http:\/\/localhost\/api\/categories?page=1",
        "prev": null,
        "next": null
    },
    "meta": {
        "current_page": 1,
        "from": 1,
        "last_page": 1,
        "path": "http:\/\/localhost\/api\/categories",
        "per_page": 15,
        "to": 8,
        "total": 8
    }
}
```

### HTTP Request
`GET api/categories`


<!-- END_109013899e0bc43247b0f00b67f889cf -->

<!-- START_20225fa91727089bf11ece1d1253eb6d -->
## api/media
> Example request:

```javascript
const url = new URL(
    "http://localhost/clipx/public/api/media"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (500):

```json
{
    "message": "Server Error"
}
```

### HTTP Request
`GET api/media`


<!-- END_20225fa91727089bf11ece1d1253eb6d -->

<!-- START_1be509e449102b13933e2891bd71f78d -->
## api/media/show/{media}
> Example request:

```javascript
const url = new URL(
    "http://localhost/clipx/public/api/media/show/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (500):

```json
{
    "message": "Server Error"
}
```

### HTTP Request
`GET api/media/show/{media}`


<!-- END_1be509e449102b13933e2891bd71f78d -->

<!-- START_a3d571d585585d7b9f2bec26e8cb6455 -->
## api/media/episodes/{media}
> Example request:

```javascript
const url = new URL(
    "http://localhost/clipx/public/api/media/episodes/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (500):

```json
{
    "message": "Server Error"
}
```

### HTTP Request
`GET api/media/episodes/{media}`


<!-- END_a3d571d585585d7b9f2bec26e8cb6455 -->

<!-- START_8759d286c0ea63794c2bd7b0f7fd69c1 -->
## api/media/ratings/{media}
> Example request:

```javascript
const url = new URL(
    "http://localhost/clipx/public/api/media/ratings/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (500):

```json
{
    "message": "Server Error"
}
```

### HTTP Request
`GET api/media/ratings/{media}`


<!-- END_8759d286c0ea63794c2bd7b0f7fd69c1 -->

<!-- START_832f60fc92a4f6b6469bcc3796c2ce18 -->
## api/media/favourites
> Example request:

```javascript
const url = new URL(
    "http://localhost/clipx/public/api/media/favourites"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (401):

```json
{
    "message": "Unauthenticated."
}
```

### HTTP Request
`GET api/media/favourites`


<!-- END_832f60fc92a4f6b6469bcc3796c2ce18 -->

<!-- START_67e62389409568fe4dee7675624f0485 -->
## api/media/favourites/{media}
> Example request:

```javascript
const url = new URL(
    "http://localhost/clipx/public/api/media/favourites/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/media/favourites/{media}`


<!-- END_67e62389409568fe4dee7675624f0485 -->

<!-- START_5e35a05b45e6f0e72eb05ed296ee43f3 -->
## api/media/ratings/{media}
> Example request:

```javascript
const url = new URL(
    "http://localhost/clipx/public/api/media/ratings/1"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/media/ratings/{media}`


<!-- END_5e35a05b45e6f0e72eb05ed296ee43f3 -->

<!-- START_5649414466f85d2a1a0155f1a0af0d0f -->
## api/payment/methods
> Example request:

```javascript
const url = new URL(
    "http://localhost/clipx/public/api/payment/methods"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
{
    "data": []
}
```

### HTTP Request
`GET api/payment/methods`


<!-- END_5649414466f85d2a1a0155f1a0af0d0f -->

<!-- START_e5bec0cd80da890ca24d66474358e1cb -->
## api/support
> Example request:

```javascript
const url = new URL(
    "http://localhost/clipx/public/api/support"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "POST",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```



### HTTP Request
`POST api/support`


<!-- END_e5bec0cd80da890ca24d66474358e1cb -->

<!-- START_53be1e9e10a08458929a2e0ea70ddb86 -->
## Show the application dashboard.

> Example request:

```javascript
const url = new URL(
    "http://localhost/clipx/public/"
);

let headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
};

fetch(url, {
    method: "GET",
    headers: headers,
})
    .then(response => response.json())
    .then(json => console.log(json));
```


> Example response (200):

```json
null
```

### HTTP Request
`GET /`


<!-- END_53be1e9e10a08458929a2e0ea70ddb86 -->


