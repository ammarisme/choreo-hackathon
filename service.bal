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
        }
    }

    resource function get items(){
        // Send a response back to the caller.
        return [{"item_id": "1", "name": "item name", "description": "item description"}, {"item_id": "2", "name": "item 2", "description": "2nd description"}];
        if (result is error) {
            var result = caller->respond("Error occurred!");
        }
    }
}
