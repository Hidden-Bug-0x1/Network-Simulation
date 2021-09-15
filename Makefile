CC=clang
CXX=clang++
CFLAGS=-Wall -g
CXXFLAGS=-Wall -g

SRC=src
OBJ=objs

CSRCS=$(wildcard $(SRC)/*.c)
CPPSRCS=$(wildcard $(SRC)/*.cpp)

COBJS=$(patsubst $(SRC)/%.c, $(OBJ)/%.o, $(CSRCS)) 
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
	@echo "Program output:"
	@$(BIN)/./$(OUT)

clean:
	$(RM) $(OBJ)/* $(BIN)/*