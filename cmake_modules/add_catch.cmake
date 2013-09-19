#==================================================================================================#
#                                                                                                  #
#  Copyright 2013 MaidSafe.net limited                                                             #
#                                                                                                  #
#  This MaidSafe Software is licensed to you under (1) the MaidSafe.net Commercial License,        #
#  version 1.0 or later, or (2) The General Public License (GPL), version 3, depending on which    #
#  licence you accepted on initial access to the Software (the "Licences").                        #
#                                                                                                  #
#  By contributing code to the MaidSafe Software, or to this project generally, you agree to be    #
#  bound by the terms of the MaidSafe Contributor Agreement, version 1.0, found in the root        #
#  directory of this project at LICENSE, COPYING and CONTRIBUTOR respectively and also available   #
#  at: http://www.maidsafe.net/licenses                                                              #
#                                                                                                  #
#  Unless required by applicable law or agreed to in writing, the MaidSafe Software distributed    #
#  under the GPL Licence is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF   #
#  ANY KIND, either express or implied.                                                            #
#                                                                                                  #
#  See the Licences for the specific language governing permissions and limitations relating to    #
#  use of the MaidSafe Software.                                                                   #
#                                                                                                  #
#==================================================================================================#
#                                                                                                  #
#  Sets up Catch using ExternalProject_Add.                                                        #
#                                                                                                  #
#  Variables set and cached by this module are:                                                    #
#    CatchSourceDir (required for subsequent include_directories calls)                            #
#                                                                                                  #
#==================================================================================================#


# Set up build steps
include(ExternalProject)
ExternalProject_Add(
    catch
    PREFIX ${CMAKE_BINARY_DIR}/catch
    GIT_REPOSITORY https://github.com/philsquared/Catch.git
    TIMEOUT 600
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
    LOG_DOWNLOAD ON
    )

# Expose required variable (CatchSourceDir) to parent scope
ExternalProject_Get_Property(catch source_dir)
set(CatchSourceDir ${source_dir}/include)
set(CatchSourceDir ${CatchSourceDir} PARENT_SCOPE)
include_directories(SYSTEM "${CatchSourceDir}")
set_target_properties(catch PROPERTIES LABELS Catch FOLDER "Third Party/Catch")