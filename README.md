# JWTRoleAuth
JWT (JSON Web Token) Authentication, Authorization and Session Management with Delphi MVC Framework

JWT stands for JSON Web Token. It is a compact, URL-safe means of representing claims to be transferred between two parties. The claims in a JWT are encoded as a JSON object that is used as the payload of a JSON Web Signature (JWS) structure or as the plaintext of a JSON Web Encryption (JWE) structure, enabling the claims to be digitally signed or integrity protected with a Message Authentication Code (MAC) and/or encrypted.

Implementing authorization involves controlling access to certain resources or functionalities based on the identity and permissions of the user. JSON Web Tokens (JWT) can play a role in this process for secure and stateless authorization.

## Authentication with JWT:
When a user logs in, generate a JWT containing relevant user claims (e.g., user ID, roles, permissions) and sign it with a secret key. Send this JWT to the client, and the client includes it in the headers of subsequent requests.

Session management is crucial for maintaining user state across multiple requests. You can implement session management in a stateless manner by storing user-related information within the JWT itself.

The basic outline of how you can manage sessions:

## 1. JWT as Session Token:
When a user logs in, create a JWT containing relevant user claims (e.g., user ID, roles) and sign it with a secret key. This JWT serves as a session token and is sent to the client.

## 2. Token Expiration:
Set an expiration time for the JWT to ensure that it remains valid for a specific duration. This helps in enhancing security and managing access control. Users will need to re-authenticate after the token expires.

## 3. Token Storage on the Client:
Store the JWT securely on the client side, typically in a secure HTTP-only cookie or in local storage. This allows the client to include the token in the headers of subsequent requests.

## 4. Refresh Tokens (Optional):
For a better user experience and enhanced security, you can implement refresh tokens. These tokens are used to obtain a new JWT without requiring the user to re-enter credentials. The refresh token is typically stored securely on the client side.

# This repository contains two applications. 

The first is the server with the example implementations of these three concepts: Authentication, Authorization, and Session Management with DMVCFramework. (Delphi MVC Framework). 

The second is a VCL Client application that serves as an example to see how each user has the authorization to access different resources. 

And finally, you can prove the session management with the client applications. See the example of logging out and Checking your session after a few minutes.

# How to use the code?

You need to run the server application without debugging and after the client application. 
If you also want to debug in the server, that is very recommended. I propose you use two virtual machines with the Delphi IDE Installed. You must run the Client on one machine and the server on the other. 
This is a good technique, too, for the normal development of this type of application. 
