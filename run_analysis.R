#
# read activity_labels and make table
#
print("Getting activity_label.txt ...")
file = "./UCI HAR Dataset/activity_labels.txt"
al <- read.table(file, sep = " ", stringsAsFactors = F)
lb <- al$V2

#
# read feature and make table
#
print("Getting feature.txt ...")
file = "./UCI HAR Dataset/features.txt"
f <- read.table(file, sep = " ", stringsAsFactors = F)
fcol <- f$V2

#
# read test/y_test.txt and convert it to factor based on activity label
#
print("Getting test/y_test.txt to test_ytf ...")
file = "./UCI HAR Dataset/test/y_test.txt"
test_yt <- read.table(file)
test_ytf <- factor(test_yt[[1]], label=lb)

#
# read test/x_test.txt and assign column names from fcol
#
print("Getting test/x_test.txt to test_xt ...")
file = "./UCI HAR Dataset/test/x_test.txt"

test_xt <- read.csv(file, sep="", stringsAsFactors = F, header = F , strip.white = T, col.names = fcol)

#
# add activity to each row
#
print("Combinning activity and test ...")
test_all <- cbind(activity=test_ytf, test_xt)

#
# read train/y_test.txt and convert it to factor based on activity label
#
print("Getting train/y_train.txt to train_ytf ...")
file = "./UCI HAR Dataset/train/y_train.txt"
train_yt <- read.table(file)
train_ytf <- factor(train_yt[[1]], label=lb)

#
# read train/x_test.txt and assign column names from fcol
#
print("Getting train/x_train.txt to train_xt ...")
file = "./UCI HAR Dataset/train/x_train.txt"

train_xt <- read.csv(file, sep="", stringsAsFactors = F, header = F , strip.white = T, col.names = fcol)

#
# add activity to each row
#
print("Combinning activity and test...")
train_all <- cbind(activity=train_ytf, train_xt)

#
# combine test and train dataset
#
print("combinning test and train datasets....")
data_all <- rbind(test_all, train_all)
#
# extract only mean and standard deviation
#
print("Extract mean and standard deviation to export_data...")
rc <- c(1:6, 41:46, 81:86, 121:126, 161:166, 201:202, 214:215, 227:228, 240:241, 253:254, 266:271, 345:350, 424:429, 503:504, 516:517, 529:530, 542:543, 555:561)

export_data <- data_all[,rc]

#
# write export data to file
#
file = "./UCI HAR Dataset/tidy.csv"
write.csv(export_data, file)





