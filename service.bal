import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get greeting(string name) returns string|error {
        // Send a response back to the caller.
        if name is "" {
            return error("name should not be empty!");
        }
        return "Hello, " + name;
    }

    resource function post item(http:Caller caller, http:Request request) {
        // Send a response back to the caller.
        var result = caller->respond("Item added successfully");
        if (result is error) {
            log:printError("Error sending response", err = result);
        }
    }
}
