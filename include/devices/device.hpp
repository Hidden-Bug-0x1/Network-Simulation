#ifndef DEVICE_HPP
#define DEVICE_HPP

#include <cstdlib>
#include <string>
#include <vector>
#include "../connections/connection.hpp"
#include "../messages/message.hpp"
#include "../messages/status.hpp"

class Device {
private:
  u_int64_t* MAC; // only need 48 bits
  std::string name; // string identifier
  std::vector<Connection*>* connection; // vector of all connections the device is "connected" to

protected:
  virtual void display(Message msg) = 0; // display the message that was received

public:
  Device(u_int64_t* MAC, std::string name); // set up a new device
  virtual STATUS_CODE forward(Message msg, Connection dest) = 0; // forward (send) a message to dest
  virtual void receive(Message msg) = 0; // callback function for connected devices to call to mimick an interaction
  virtual bool connect(Connection* con) = 0; // add a connection to the list of connected devices
};

#endif