# actMapping In R


Starting to sketch out a package (in R) of functions that would be useful to those trying to unpack the ACT's fixed width file format for the student records sent to schools. 

The ACT provides schools with disks containing student results. These CDs contain a Fixed Width File (FWF) in a password protected WinZip folder. The FWF is an ASCII line sequental file with carriage return and line feed at the end of a reccord. A reccord is 1050 characters in length (Some Characters are blank). An individual disk can contain upto 700MB or 600,000 reccords.




## Functions

### ReadACT()
This function allows users to read in a fixed width file and provides the mapping based on year. This acts as a wrapper for read.fwf that allows for easy reading without creation of the mapping by hand each time.


The function is called as such:


```R
ReadACT(file="path", mapping="year")

```

This returns a data.frame with columns that have been mapped. Right now the mapping provides 196 columns includeing the blanks. 


### FindComments()
This function converts the comment codes into the comments

#### Comment Codes and Their Equivalents 

The ACT provides a list of 4 potential comments for each writing section. Those comments are provided by way of a 2 digit comment code which needs to be matched to a table of comments
right now the provided link to their table is missing and so I have created this table for manual look up of ACT comment Codes and their equivalent text. 

<details><summary> Show table</summary> 
<p> 

|Comment Code |	Comment Text|
|---|--------|
|01|	The pages submitted for the Writing Test could not be scored. No score is possible if the pages were left blank or were marked void at the test center, or if the essay is illegible, is not written in English, or does not respond to the prompt. In any of these cases, no Combined English/Writing score or Writing subscore can be reported.|
|02|	Combined English/Writing score and Writing subscore can be reported only when there is a valid English score. Because there were no responses to any items on the multiple-choice English Test, no Combined English/ Writing or Writing subscore can be reported.|
|20|	Your essay responded to the prompt by taking a position on the issue.|
|21|  Your essay responded to the prompt by taking a clear position on the issue.|
|22|	Your essay acknowledged counterarguments on the issue but did not discuss them.|
|23|	Your essay showed recognition of the complexity of the issue by addressing counterarguments.|
|24|	Your essay showed recognition of the complexity of the issue by partially evaluating |its implications.|
|25|	Your essay addressed the complexity of the issue by fully responding to counterarguments.|
|26|	Your essay addressed the complexity of the issue by evaluating its implications.|
|30|	Your essay provided very little writing about your ideas.  Try to write more about the topic.|
|31|	The ideas in your essay needed to be more fully explained and supported with more details.|
|32|	Your essay used some specific details, reasons, and examples, but it needed more of them.|
|33|	Your essay adequately supported general statements with specific reasons, examples, and details.
|34|	General statements in your essay were well supported with specific reasons, examples, and details.|
|35|	Your essay effectively supported general statements with specific reasons, examples, and details.|
|40|	Your writing did not maintain a focus on the issue.  Try to plan your essay before you write.|
|41|	Your essay focused on the general topic rather than on the specific issue in the prompt.|
|42|	Your essay maintained focus on the specific issue in the prompt.|
|50|	Your essay lacked organization.  Try to plan and arrange your ideas logically.|
|51|	Your essay was not clearly organized.  Try to plan and arrange your ideas logically.|
|52|	Your essay showed basic organizational structure, but the ideas needed to be more clearly connected.|
|53|	The organization of your essay was adequate, but the rigid structure seemed to limit discussion.|
|54|	Your essay was well organized, making it easy to understand logical relationships among ideas.|
|55|	The logical sequence of ideas in your essay fit its persuasive purpose well.|
|60|	Grammar, spelling, and punctuation errors made your essay difficult to understand.|
|61|	Grammar, spelling, and punctuation errors were distracting.  Proofread your writing.|
|62|	Using correct grammar and more varied sentence structures would improve your essay.|
|63|	Using more varied sentence structures would make your essay clearer and more engaging.|
|64|	Using more sentence variety and precise word choice would make your essay clearer and more engaging.|
|65|	Some varied sentences structures and precise word choice added clarity and interest to your writing.|
|66|	Your essay showed a good command of language by using varied sentences and precise word choice.|

</p>
</details>

Source: http://wcpssact.pbworks.com/w/page/47519725/ACT%20Plus%20Writing%20Essay%20Comments



