//
//  ALMemory.m
//  ALSystem
//
//  Created by Andrea Mario Lufino on 21/07/13.
//  Copyright (c) 2013 Andrea Mario Lufino. All rights reserved.
//

#import "ALMemory.h"
#import <mach/mach.h>
#import <mach/mach_host.h>

@implementation ALMemory

+ (NSInteger)totalMemory {
    NSInteger nearest = 256;
    NSInteger totalMemory = (NSInteger)([[NSProcessInfo processInfo] physicalMemory] / 1024 / 1024);
    NSInteger rem = totalMemory % nearest;
    NSInteger tot = totalMemory - rem;
    if (rem >= nearest/2) {
        tot += 256;
    }
  
    return tot;
}

+ (CGFloat)freeMemory {
    double totalMemory = 0.00;
    
    mach_port_t host_port;
    mach_msg_type_number_t host_size;
    vm_size_t pagesize;
    
    // Get the variable values
    host_port = mach_host_self();
    host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    host_page_size(host_port, &pagesize);
    
    vm_statistics_data_t vmStats;
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vmStats, &infoCount);
    if(kernReturn != KERN_SUCCESS) {
        return -1;
    }
    totalMemory = ((pagesize * vmStats.free_count) / 1024) / 1024;
    
    return totalMemory;
}

+ (CGFloat)usedMemory {
    double usedMemory = 0.00;
    
    mach_port_t host_port;
    mach_msg_type_number_t host_size;
    vm_size_t pagesize;
    
    // Get the variable values
    host_port = mach_host_self();
    host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    host_page_size(host_port, &pagesize);
    
    vm_statistics_data_t vmStats;
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vmStats, &infoCount);
    if(kernReturn != KERN_SUCCESS) {
        return -1;
    }
    usedMemory = ((pagesize * (vmStats.active_count + vmStats.inactive_count + vmStats.wire_count)) / 1024) / 1024;
    
    return usedMemory;
}

+ (CGFloat)activeMemory {
    double activeMemory = 0.00;
    
    mach_port_t host_port;
    mach_msg_type_number_t host_size;
    vm_size_t pagesize;
    
    // Get the variable values
    host_port = mach_host_self();
    host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    host_page_size(host_port, &pagesize);
    
    vm_statistics_data_t vmStats;
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vmStats, &infoCount);
    if(kernReturn != KERN_SUCCESS) {
        return -1;
    }
    activeMemory = ((pagesize * vmStats.active_count) / 1024) / 1024;
    
    return activeMemory;
}

+ (CGFloat)wiredMemory {
    double wiredMemory = 0.00;
    
    mach_port_t host_port;
    mach_msg_type_number_t host_size;
    vm_size_t pagesize;
    
    // Get the variable values
    host_port = mach_host_self();
    host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    host_page_size(host_port, &pagesize);
    
    vm_statistics_data_t vmStats;
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vmStats, &infoCount);
    if(kernReturn != KERN_SUCCESS) {
        return -1;
    }
    wiredMemory = ((pagesize * vmStats.wire_count) / 1024) / 1024;
    
    return wiredMemory;
}

+ (CGFloat)inactiveMemory {
    double inactiveMemory = 0.00;
    
    mach_port_t host_port;
    mach_msg_type_number_t host_size;
    vm_size_t pagesize;
    
    // Get the variable values
    host_port = mach_host_self();
    host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    host_page_size(host_port, &pagesize);
    
    vm_statistics_data_t vmStats;
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vmStats, &infoCount);
    if(kernReturn != KERN_SUCCESS) {
        return -1;
    }
    inactiveMemory = ((pagesize * vmStats.inactive_count) / 1024) / 1024;
    
    return inactiveMemory;
}

@end
