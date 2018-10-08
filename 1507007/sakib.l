%{
	#include<stdio.h>
	int keywords=0,bracket=0,punctuations=0,reloperators=0,arioperators=0,logoperators=0,identifiers=0,ipositive=0,inegative=0,fpositive=0,fnegative=0,strings=0;
%}
KEYWORD global|class|float|integer|continue|string|break|else|long|switch|case|enumeration|register|typedefine|character|external|return|union|constant|float|unsigned|continue|for|signed|void|default|goto|sizeof|volatile|do|if|static|while
BRACKET p1_S|p1_E|p2_S|p2_E|p3_S|p3_E
PUNCTUATION semicolon|comma
RELOPERATOR equal|less|greater|greater_or_Eq|less_or_Eq
ARIOPERATOR plus|minus|multiply|divide
LOGOPERATOR and|or|not
SINGLE_COMMENT        "//"
MULTI_COMMENT       "/*"|"*/"
STRING [a-zA-Z]*[0-9]*[a-zA-Z]*
IDENTIFIER "function"[a-zA-Z][a-zA-Z0-9]*|"class"[a-zA-Z][a-zA-Z0-9]*|"var"[a-zA-Z][a-zA-Z0-9]*
HASH        "#"
AMPERSAND    "&"
PERCENTAGE  "%"
DOLLER       "$"
POWER       "^"

%%
{KEYWORD}   {
				printf("keyword \"%s\" \n",yytext);
				keywords++;
			}
{BRACKET}  {
				printf("bracket \"%s\" \n",yytext);
				bracket++;
			}	
{PUNCTUATION}  {
				printf("punctuation \"%s\" \n",yytext);
				punctuations++;
			}					
{RELOPERATOR}  {
				printf("relational_operator \"%s\" \n",yytext);
				reloperators++;
			}						
{ARIOPERATOR}  {
				printf("arithmetic_operator \"%s\" \n",yytext);
				arioperators++;
			}									
{LOGOPERATOR}  {
				printf("logical_operator \"%s\" \n",yytext);
				logoperators++;
			}
{IDENTIFIER}  {
				printf("the identifier \"%s\" \n",yytext);
				identifiers++;
			}
{SINGLE_COMMENT}                               printf("%s is a Single line Command\n ", yytext);
{MULTI_COMMENT}                               printf("%s is a multi line command \n", yytext);

"plus"[0-9]+|[0-9]+ {
				printf("positive integer_number \"%s\" \n",yytext);
				ipositive++;
			}
"minus"[0-9]+ {
				printf("negative integer_number \"%s\" \n",yytext);
				inegative++;
			}			
"plus"[0-9]*"."[0-9]+|[0-9]*"."[0-9]+ {
				printf("positive float_number \"%s\" \n",yytext);
				fpositive++;
			}
"minus"[0-9]*"."[0-9]+ {
				printf("negative float_number \"%s\" \n",yytext);
				fnegative++;
			}			
{STRING}	{
				printf("the string \"%s\" \n",yytext);
				strings++;
			}
{HASH}                                printf("%s is a Hash Sign\n ", yytext);
{AMPERSAND}                           printf("%s is a Ampersand \n", yytext);
{PERCENTAGE}                          printf("%s is a Percentange Sign \n", yytext);
{DOLLER}                              printf("%s is a Dollar Sign \n", yytext);
{POWER}                               printf("%s is a Power Sign \n", yytext);

			
.
%%
int yywrap()
{
	return 1;
}
int main()
{
	yyin=freopen("input.txt","r",stdin);
	yylex();
	printf("Total keywords: %d\n",keywords);
	printf("Total brackets: %d\n",bracket);
	printf("Total punctuations: %d\n",punctuations);
	printf("Total relational operators: %d\n",reloperators);
	printf("Total arithmetic operators: %d\n",arioperators);
	printf("Total logical operators: %d\n",logoperators);
	printf("Total Operators found: %d\n",reloperators+arioperators+logoperators);
	printf("Total Integer numbers(positive and negative): %d and %d\n",ipositive,inegative);
	printf("Total Float numbers(positive and negative): %d and %d\n",fpositive,fnegative);
	printf("Total Strings: %d\n",strings);
	printf("Total identifiers found: %d\n",identifiers);
	fclose(yyin);
	return 0;
}