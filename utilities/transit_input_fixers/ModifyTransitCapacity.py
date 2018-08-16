import datetime,os,pandas,sys
import partridge
import Wrangler

USAGE = """

Script to write vehicle type (transit capacity) information from an excel file to the transit line file

"""

USERNAME     = os.environ["USERNAME"]
LOG_FILENAME = "modify_transit_capacity.log"
TM2_INPUTS   = os.path.join(r"C:\\Users", USERNAME, "Box\\Modeling and Surveys\\Development\\Travel Model Two Development\\Model Inputs")
TRN_NETFILE  = os.path.join(TM2_INPUTS,"2015","trn","transit_lines")

# read the PT transit network line file
trn_net = Wrangler.TransitNetwork(champVersion=4.3, basenetworkpath=TRN_NETFILE, isTiered=True, networkName="transitLines")


# read the excel file with vehicle type information
# df = pd.read_excel('File.xlsx', sheetname='Sheet1')
# df = pandas.read_excel('Line and vehicle type_be.xlsx', sheetname='Sheet1')
VehicleType_df = pandas.read_excel(r"M:\\Development\\Travel Model Two\\Supply\\Transit\\Network_QA\\Line and vehicle type_be.xlsx", sheetname='transit_input_summary')


# Use a loop to iterate over the list:
# for i in VehicleType_df.index:
#    print(VehicleType_df['Sepal width'][i])

# for line in trn_net:
#    for node_idx in range(len(line.n)):
#    for i in VehicleType_df.index:
#        if line.name = VehicleType_df['Line_name'][i]:
#            line['VEHICLETYPE'] = VehicleType_df['Vehicle Type'][i]

for line in trn_net:
    for i in VehicleType_df.index:

#        if VehicleType_df['Line_name'][i]==line.name:

        line_name_excel = str(VehicleType_df['Line_name'][i])
        line_name_linefile = str(line.name)
            # drop the "u" at the beginning of the string
    #        line_name_string = line_name_string [1:]
        print("Processing:", i, line_name_excel, line_name_linefile)
    #            if line.name == VehicleType_df['Line_name'][i]:
        if line_name_linefile == line_name_excel:
            line['VEHICLETYPE'] = VehicleType_df['Vehicle Type'][i]
            print(i, line.name, VehicleType_df['Line_name'][i], VehicleType_df['Vehicle Type'][i])

			# if the vehicle type is blank, then assume it is a standard bus			
        if  str(line['VEHICLETYPE']) =="nan":
            line['VEHICLETYPE'] = 1
				
            break
        else:
            continue 


trn_net.write(path=".", name="transitLines", writeEmptyFiles=False, suppressValidation=True)
