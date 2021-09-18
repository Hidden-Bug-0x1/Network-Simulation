CXX=clang++
CXXFLAGS=-Wall -g

SRC=src
OBJ=objs

CPPSRCS=$(wildcard $(SRC)/*.cpp)

CPPOBJS=$(patsubst $(SRC)/%.cpp, $(OBJ)/%.o, $(CPPSRCS))

BIN=bins
OUT=netsim

$(BIN)/$(OUT): $(COBJS) $(CPPOBJS)
	$(CXX) -o $@ $(SRC)/main.cpp 

$(COBJS): $(CSRCS)
	$(CC) $(CFLAGS) -c -o %@ $<

$(CPPOBJS): $(CPPSRCS)
	$(CXX) $(CXXFLAGS) -c -o $@ $<

run:
	@$(BIN)/./$(OUT)

clean:
	$(RM) $(OBJ)/* $(BIN)/*